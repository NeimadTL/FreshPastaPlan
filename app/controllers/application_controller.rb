class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  # redirect to subscription form after sign in
  def after_sign_in_path_for(resource_or_scope)
    return new_users_subs_relationship_url unless current_user.subscription
    root_path
  end

  def not_found(e)
    render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
  end

end
