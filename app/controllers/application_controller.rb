class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


def after_sign_in_path_for(resource)
	user_path(resource.id)
end

def after_sign_out_path_for(resource)
    flash[:alert] = "Signed out successfully."
    root_path
end

def after_sign_up_path_for(resource)
	flash[:notice] = "登録完了"
	books_path
end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
