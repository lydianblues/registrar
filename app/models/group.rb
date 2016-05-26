class Group < ApplicationRecord
	has_many :registrations, as: :registerable
	has_and_belongs_to_many :students
	belongs_to :owner, class_name: :Student

	def label
		"#{id} last updated by #{owner.wp_first_name} #{owner.wp_last_name} on #{updated_at.strftime("%b %-d, %Y")}"

	end
end
