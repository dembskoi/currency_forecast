class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation])
  end

  def after_sign_out_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    router_name = Devise.mappings[scope].router_name
    context = router_name ? send(router_name) : self
    context.respond_to?(:new_user_session_path) ? context.new_user_session_path : '/'
  end
end
