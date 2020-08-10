class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.Basic_username && password == Rails.application.credentials.Basic_password
    end
  end

end