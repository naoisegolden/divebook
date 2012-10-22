class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || session[:return_to]  || user_path(resource)
  end

end