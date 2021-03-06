class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:career_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar,:firstname,:lastname, :username,:career_id, :about, :bio,:skill_id])
  end
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
  def after_sign_up_path_for(resources)
    stored_location_for(resource) || root_path
  end
end
