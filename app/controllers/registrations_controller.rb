class RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:edit, :update]
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resource)
    transit_home_path  
  end

  def after_sign_in_path_for(resource)
    posts_path
  end

  def update_resource(resource, account_update_params)
    resource.update_without_password(account_update_params)
  end

  def after_update_path_for(resource)
    #redirect_to [current_account, resource]
    user_path(current_user)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, except: [:current_password, :password])
  end

  def account_update_params
    params.require(:user).permit(:username, :firstname, :lastname, :career_id, :about, :bio)
  end
end