class Training < ApplicationRecord
  belongs_to :course
  belongs_to :facilitator
  belongs_to :location
end
