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

    ### Read this from a file that is not checked in to GitHub!!! TODO
    API_TOKEN = "LwveqfAx78GuYOQPhDH4WQ=="

    def staff_or_token_access

      # OK if the user is logged in.
      return if current_user

      # Try with the Api Key.
      api_key = request.headers['X-Api-Key']
      return if api_key == API_TOKEN

      redirect_to root_path, alert: 'Niroga staff only!'

    end

end
