class ApiController < ApplicationController
	before_action :staff_or_token_access
	wrap_parameters false

	# Create a new Registration.
	def create
		
		training = Training.find(params[:training_id])

		# Validation should be in the Registration model?
		reg_type = params[:reg_type]
		unless ['group-inclusive', 'group-exclusive',
			'single-self', 'single-other'].include?(reg_type) 
			
			raise "Invalid registration type"
		end
		
		#
		# Find or create the owner.  There should always be one since the ower
		# is the entity that pays for the the registration. The owner may already
		# be in the database from a previous transaction. 
		#
		owner = Student.create_or_update!(params[:owner])
		
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
			friend = Student.create_or_update!(params[:participants][0])
			registration.registerable = friend
		elsif group_registration
			member_list = params[:participants]
			member_list.each do |member_params|

				member = Student.create_or_update!(member_params)

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

	# Partial or full refund of a registration.
	def refund
		respond_to do |format|
			format.json do
				render inline: "{\"status\": \"OK\"}", status: 200
			end
		end
	end

	# Cancel a registration. An individual or all group members
	# are removed from the Training.
	def cancel
		respond_to do |format|
			format.json do
				render inline: "{\"status\": \"OK\"}", status: 200
			end
		end
	end

	# DEPRECATED: Use 'skip_before_action' instead
	skip_before_filter :verify_authenticity_token

	def api_params
      params.require(:student).permit(:wp_login, :wp_first_name, :wp_last_name, :wp_email,
        :wp_display_name, :wp_id, :email_list, :occupation, :organization)
    end
end
