class UsersSubsRelationshipsController < ApplicationController

  before_action :set_user_subs_relationship, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :require_to_have_no_subscription, only: [:new, :create]

  def new
    @users_subs_relationship = UsersSubsRelationship.new
  end

  def create
    @users_subs_relationship = UsersSubsRelationship.create(users_subs_relationship_params.merge(user: current_user))
    if @users_subs_relationship.valid?
      flash[:notice] = 'Thanks for choosing your plan :)'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    last_order = current_user.orders.last
    if last_order && current_user.can_still_add_pasta?(last_order)
      flash[:alert] = "You can't change plan now because pastas are missing on your last order"
      redirect_to root_path
    else
      @users_subs_relationship.update_attributes(users_subs_relationship_params)
      if @users_subs_relationship.valid?
        flash[:notice] = 'Your plan has been updated'
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private
    def users_subs_relationship_params
      params.require(:users_subs_relationship).permit(:subscription_id)
    end

    def set_user_subs_relationship
      @users_subs_relationship = UsersSubsRelationship.find(params[:id])
    end

    def require_to_have_no_subscription
      if current_user.subscription
        flash[:notice] = 'You already have a subscription'
        redirect_to root_path
      end
    end
end
