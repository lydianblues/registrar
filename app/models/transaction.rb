class Transaction < ApplicationRecord
	belongs_to :registration
	belongs_to :owner, class_name: 'Student'
end
