require 'datatables_query'

class Group < ApplicationRecord
	has_many :registrations, as: :registerable
	has_and_belongs_to_many :students
	belongs_to :owner, class_name: :Student, foreign_key: "student_id"

	extend ::DataTables::Query

	def label
		"#{id} last updated by #{owner.wp_first_name} #{owner.wp_last_name} on #{updated_at.strftime("%b %-d, %Y")}"
	end

	def handle
		owner.wp_last_name + '#' + id.to_s
	 end
end
