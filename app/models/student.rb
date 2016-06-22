require 'datatables_query'

class Student < ApplicationRecord
	has_many :registrations, as: :registerable
	has_and_belongs_to_many :groups
	has_many :transactions

	extend ::DataTables::Query

	def label
		"#{id} #{wp_first_name} #{wp_last_name}"
	end

	def handle
		wp_first_name + " " + wp_last_name
	end

end

