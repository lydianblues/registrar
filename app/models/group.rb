class Group < ApplicationRecord
	has_many :registrations, as: :registerable
	has_and_belongs_to_many :students
	belongs_to :leader, class_name: :Student

	def label
		"#{id} last updated by #{leader_first} #{leader_last} on #{updated_at.strftime("%b %-d, %Y")}"

	end
end
