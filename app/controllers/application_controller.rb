class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource) 
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_year, :birth_month, :birth_day, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :first_name, :last_name, :first_name_kana, :last_name_kana, :post_number, :prefecture, :city, :address_number, :building, :phone_number, :user_id])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end


end
