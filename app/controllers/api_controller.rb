class ApiController < ApplicationController
	wrap_parameters false

	# Create a new Registration.
	def create
		
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
		
		#
		# Find or create the owner.  There should always be one since the ower
		# is the entity that pays for the the registration. The owner may already
		# be in the database from a previous transaction. 
		#
		owner_params = params[:owner]
		owner = Student.find_by_wp_email(owner_params[:wp_email])
		unless owner 
			owner = Student.find_by_wp_login(owner_params[:wp_login])
			if owner && owner_params[:wp_email]
				owner.wp_email = owner_params[:wp_email]
			end
			unless owner
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
			end	
		end
		
		group_registration =
			['group-inclusive', 'group-exclusive'].include?(reg_type)

		proxy_registration = reg_type == 'single-other'
		self_registration = reg_type == 'single-self'		
		
		#
		# Create the group to hold the participants.  Every group registration
		# creates a new group.  There is no way to reuse a group created in 
		# an earlier registration for a later registration.
		#
		if (group_registration)
			group = Group.new
			group.owner = owner;
			group.save! # to generate the group id needed in next line
			group.tag = owner.wp_last_name + "#" + group.id.to_s
		end
		
		registration = Registration.new
		registration.training = training
		registration.owner = owner
		registration.reg_type = reg_type

		# Fix this.  We need to have a sequence in the database.
		registration.code  = 100000 + rand(900000)
		
		if self_registration
			registration.registerable = owner
		elsif proxy_registration
			friend_params = params[:participants][0]

			if friend_params[:wp_email].blank? 
				render  inline: "{\"status\": \"Registrant has no email\"}"
				return
			end
			friend = Student.find_by_wp_email(friend_params[:wp_email])
			if friend
				# Maybe do update from current parameters
			else
				friend = Student.new(
					wp_email: friend_params[:wp_email],
					wp_first_name: friend_params[:wp_first_name],
					wp_last_name: friend_params[:wp_last_name],
					email_list: friend_params[:email_list],
					occupation: friend_params[:occupation]
				)
			end
			registration.registerable = friend
		elsif group_registration
			member_list = params[:participants]
			member_list.each do |member_params|
				member = Student.find_by_wp_email(member_params[:wp_email])
				if member 
					# Update the database.  For all the parameter fields that are
					# not blank (except wp_email), replace the existing values
					# with the values in the parameters.
					unless member_params[:wp_first_name].blank?
						member.wp_first_name = member_params[:wp_first_name]
					end
					unless member_params[:wp_last_name].blank?
						member.wp_last_name = member_params[:wp_last_name]
					end
					member.email_list = member_params[:email_list] # boolean
					unless member_params[:occupation].blank?
						member.occupation = member_params[:occupation]
					end
					unless member_params[:organization].blank?
						member.organization = member_params[:organization]
					end
				else	
					member = Student.new(
						wp_email: member_params[:wp_email],
						wp_first_name: member_params[:wp_first_name],
						wp_last_name: member_params[:wp_last_name],
						email_list: member_params[:email_list],
						occupation: member_params[:occupation],
						organization: member_params[:organization]
					)
				end
				member.save!
				# Add the new member to the group
				group.students << member
				
			end
			registration.registerable = group
		end
		
		registration.save!

		render inline: "{\"status\": \"OK\", \"reg_id\": #{registration.id}}"

	end

	# Get the details about a Registration.
	def show
		@registration = Registration.find(params[:id])

		respond_to do |format|
    		format.html
    		format.json
  		end

	end

	# Update a Registration by flagging it as paid for and
	# adding the corresponding transaction to it.
	def update		
		unless (params[:success] == "false")			
			@registration = Registration.find(params[:id])
			@registration.paid_for = true
			@registration.amt_paid = 0 # FIXME, should this be an increment?
			@registration.save!
			@transaction = Transaction.new
			@transaction.registration = @registration
			@transaction.owner = @registration.owner
			@transaction.setup(params[:bt_id])
			@transaction.save!
		end
		render  inline: "{\"status\": \"OK\"}"
	end

	def refresh
		@transaction = Transaction.find(params[:id])
		@transaction.refresh
		respond_to do |format|
			format.js { render layout: false, content_type: 'text/javascript' }
		end
	end


	# DEPRECATED: Use 'skip_before_action' instead
	skip_before_filter :verify_authenticity_token

	def api_params
      params.require(:student).permit(:wp_login, :wp_first_name, :wp_last_name, :wp_email,
        :wp_display_name, :wp_id, :email_list, :occupation, :organization)
    end
end
