require 'rails_helper'

RSpec.describe UsersSubsRelationshipsController, type: :controller do

  User.delete_all

  let(:user) {
    User.create!(email: "user@gmail.com", password: "12345678", password_confirmation: "12345678")
  }

  describe "when GET #new" do
    before do
      sign_in(user, nil)
    end

    it "returns http success when user is logged in and have no subscription" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "returns http redirect when user is logged in and user has already a subscription" do
      subscription = Subscription.last
      UsersSubsRelationship.create!(user_id: user.id, subscription_id: subscription.id)
      get :new
      expect(flash[:notice]).to match('You already have a subscription')
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it "returns http redirect when user isn't logged in" do
      sign_out(user)
      get :new
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "when POST #create" do
    before do
      sign_in(user, nil)
    end

    it "returns http redirect when user is logged in, have no subscription and good params" do
      count = UsersSubsRelationship.count
      subscription = Subscription.last
      post :create, params: { users_subs_relationship: { subscription_id: subscription.id } }
      expect(UsersSubsRelationship.count).to eql count + 1
      expect(flash[:notice]).to match('Thanks for choosing your plan :)')
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it "returns http unprocessable entity when user is logged in, have no subscription and bad params" do
      count = UsersSubsRelationship.count
      post :create, params: { users_subs_relationship: { subscription_id: nil } }
      expect(UsersSubsRelationship.count).to eql count
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end

    it "returns http redirect when user is logged in, has already a subscription and good params" do
      subscription = Subscription.last
      UsersSubsRelationship.create!(user_id: user.id, subscription_id: subscription.id)
      count = UsersSubsRelationship.count
      post :create, params: { users_subs_relationship: { subscription_id: subscription.id } }
      expect(UsersSubsRelationship.count).to eql count
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it "returns http redirect when user isn't logged in" do
      sign_out(user)
      subscription = Subscription.last
      post :create, params: { users_subs_relationship: { subscription_id: subscription.id } }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "when GET #edit" do
    before do
      sign_in(user, nil)
    end

    it "returns http success when user is logged with good params" do
      subscription = Subscription.last
      users_subs_relationship = UsersSubsRelationship.create!(user_id: user.id, subscription_id: subscription.id)
      get :edit, params: { id: users_subs_relationship.id }
      expect(response).to have_http_status(:success)
    end

    # it "returns http success when user is logged with bad params" do
      # put that following code in ApplicationController
      # ---------------------------------------------------------------------------------------
        # rescue_from ActiveRecord::RecordNotFound, :with => :not_found
        # def not_found(e)
        #   render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
        # end
      # ---------------------------------------------------------------------------------------
    # end

    it "returns http redirect when user isn't logged in" do
      sign_out(user)
      subscription = Subscription.last
      users_subs_relationship = UsersSubsRelationship.create!(user_id: user.id, subscription_id: subscription.id)
      get :edit, params: { id: users_subs_relationship.id }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "when PUT #update" do
    before do
      sign_in(user, nil)
    end

    it "returns http redirect when user is logged with good params" do
      subscription = Subscription.last
      another_subscription = Subscription.first
      users_subs_relationship = UsersSubsRelationship.create!(user_id: user.id, subscription_id: subscription.id)
      put :update, params: { id: users_subs_relationship.id,
        users_subs_relationship: { subscription_id: another_subscription.id } }
      updated_user_sub_relationship = UsersSubsRelationship.find(users_subs_relationship.id)
      expect(updated_user_sub_relationship.subscription_id).to eql another_subscription.id
      expect(flash[:notice]).to match('Your plan has been updated')
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    # it "returns http redirect when user is logged with bad params" do
      # put that following code in ApplicationController
      # ---------------------------------------------------------------------------------------
        # rescue_from ActiveRecord::RecordNotFound, :with => :not_found
        # def not_found(e)
        #   render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
        # end
      # ---------------------------------------------------------------------------------------
    # end

    it "returns http redirect when user isn't logged in" do
      sign_out(user)
      subscription = Subscription.last
      another_subscription = Subscription.first
      users_subs_relationship = UsersSubsRelationship.create!(user_id: user.id, subscription_id: subscription.id)
      put :update, params: { id: users_subs_relationship.id,
        users_subs_relationship: { subscription_id: another_subscription.id } }
      not_updated_user_sub_relationship = UsersSubsRelationship.find(users_subs_relationship.id)
      expect(not_updated_user_sub_relationship.subscription_id).to eql subscription.id
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
    end

  end

end
