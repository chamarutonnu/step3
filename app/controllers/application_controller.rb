class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :second_name, :first_name_kana, :second_name_kana, :profile_image, :email, :user_name, :introduction, :is_sex, :category, :season_id])
  end
end
