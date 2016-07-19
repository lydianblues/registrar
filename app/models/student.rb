require 'datatables_query'

class Student < ApplicationRecord
	has_many :registrations, as: :registerable
	has_and_belongs_to_many :groups
	has_many :transactions

    validates :wp_email, presence: true, uniqueness: true
    validates :wp_first_name, presence: true
    validates :wp_last_name, presence: true

	extend ::DataTables::Query

	def label
		"#{id} #{wp_first_name} #{wp_last_name}"
	end

	def handle
		(wp_first_name.nil? ? "" : wp_first_name) +
        " " + 
        (wp_last_name.nil? ? "" : wp_last_name)
	end


    # TODO Do we need to sanitize these parameters?
    def self.create_or_update!(params)

        unless params.key?(:wp_email) && !params[:wp_email].blank?
            raise ArgumentError.new("wp_email can't be blank.")
        end           

    	student = Student.find_by_wp_email(params[:wp_email])

        if student
            [:wp_id, :wp_login, :wp_first_name, :wp_last_name,
                :occupation, :wp_display_name, :student_discount,
                :email_list, :organization].each do |field|

                (!params.key?(field) || params[field].blank?) ||
                    (student.send((field.to_s + '=').to_sym, params[field]))
            end
            # This is handled separately, because the 'false' boolean
            # passes the blank? test.

            student.email_list = params[:email_list] if params.key?(:email_list)
            student.student_discount = params[:student_discount] if params.key?(:student_discount)
    	else
            attrs = {}
            [:wp_id, :wp_login, :wp_email, :wp_first_name, :wp_last_name,
                :occupation, :wp_display_name, :student_discount,
                :email_list, :organization].each do |field|

                attrs[field] = params[field] if params.key?(field)

            end
            student = Student.new(attrs)  
        end
        student.save!
        student
    end
end
