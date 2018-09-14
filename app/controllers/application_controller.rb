class ApplicationController < ActionController::Base

  # redirect to subscription form after sign in
  def after_sign_in_path_for(resource_or_scope)
    new_users_subs_relationship_url
  end

end
