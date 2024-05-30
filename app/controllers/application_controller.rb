class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute1, :attribute2])
  end

  # Override require_no_authentication to allow signed-in users to access sign-up page
  def require_no_authentication
    assert_is_devise_resource!
  end


  def after_sign_up_path_for(resource)
    user_path(resource) # Redirect to the user's profile page
  end
end
