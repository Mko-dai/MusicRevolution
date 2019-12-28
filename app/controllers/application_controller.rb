class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
#mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!        
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
