class ApiController < ApplicationController

	def register
		byebug

		training_id = params[:training_id]
		if training_id.blank? 
			render  inline: "{\"status\": \"Training ID is missing\"}"
			return
		end

		begin
			training = Training.find(training_id)
		rescue ActiveRecord::RecordNotFound
			render  inline: "{\"status\": \"Training ID is is invalid\"}"
			return
		end

		# Validation should be in the Registration model?
		reg_type = params[:reg_type]
		unless ['group-inclusive', 'group-exclusive',
			'single-self', 'single-other'].include?(reg_type) 
			render  inline: "{\"status\": \"Registration Type is invalid\"}"
			return
		end

		# Are we registering a group?
		group_registration =
			['group-inclusive', 'group-exclusive'].include?(reg_type)

		proxy_registration = reg_type == 'single-other'
		self_registration = reg_type == 'single-self'

		#
		# Create the group owner or proxy.
		#
		# If this registration is on behalf of a different person,
		# (reg_type = single-other) then the owner is the proxy and
		# the participants array contains the person who is taking
		# the course.
		# 
		owner_params = params[:owner]
		owner = Student.new(
			wp_id: owner_params[:wp_id],
			wp_login: owner_params[:wp_login],
			wp_email: owner_params[:wp_email],
			wp_first_name: owner_params[:wp_first_name],
			wp_last_name: owner_params[:wp_last_name],
			wp_display_name: owner_params[:wp_display_name],
			occupation: owner_params[:occupation],
			organization: owner_params[:organization],
			email_list: owner_params[:email_list])

		# Create the group to hold the participants
		if (group_registration)
			group = Group.new
			group.owner = owner;
			group.save! # Also saves the owner
		end
		

		

		
	


		participants = params[:participants]



		render inline: "{\"status\": \"OK\"}"


	end

	skip_before_filter :verify_authenticity_token

	def api_params
      params.require(:student).permit(:wp_login, :wp_first_name, :wp_last_name, :wp_email,
        :wp_display_name, :wp_id, :email_list, :occupation, :organization)
    end
end
