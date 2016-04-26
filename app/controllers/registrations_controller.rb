class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) do |user| 
     user.permit(:email, :username, :password)
    end
     devise_parameter_sanitizer.for(:account_update) do |user| 
       user.permit(:email, :username, :password, :password_confirmation, :name, :surname, :current_password, :avatar)
     end
  end

  def update_resource(resource, params)
  	if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params)
    else 
 	    super
    end
  end
end