class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # このアクションを追加
  def after_sign_in_path_for(user)
    "/user/#{current_user.id}"
  end

  def after_sign_in_path_for(admin)
    "/admin/"
  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
