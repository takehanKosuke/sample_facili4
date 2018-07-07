class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?
   # before_action :move_to_login , expect: :devise

  private
  # def move_to_login
  #   redirect_to "new_user_session" unless user_signed_in?
  # end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:faculty_id, :department_id, :gread_id])
    end
end
