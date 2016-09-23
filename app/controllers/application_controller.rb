class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale


private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    #current_use.locale
    #request.subdomain
    #request.env["HTTP_ACCEPT_LANGUAGE"]
    #request.remote_ip
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :lastname, :firstname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :lastname, :firstname])
  end
end
