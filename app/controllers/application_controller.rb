class ApplicationController < ActionController::Base

  # redirect to subscription form after sign in
  def after_sign_in_path_for(resource_or_scope)
    return new_users_subs_relationship_url unless current_user.subscription
    root_path
  end

end
