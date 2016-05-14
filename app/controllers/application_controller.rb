class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def authorize_admin
    	return if (current_user && current_user.admin?)
    	redirect_to root_path, alert: 'Admins only!'
  	end

  	def staff_only
  		return if current_user
  		redirect_to root_path, alert: 'Niroga staff only!'
  	end

end
