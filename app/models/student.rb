class Student < ApplicationRecord
	has_many :registrations, as: :registerable
	has_and_belongs_to_many :groups

	def label
		"#{id} #{first_name} #{last_name}"
	end
end
