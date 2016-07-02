class Training < ApplicationRecord
  belongs_to :course
  belongs_to :facilitator
  belongs_to :location
  has_many :registrations

  monetize :regular_price_cents
  monetize :group_price_cents
  monetize :student_price_cents
  monetize :early_regular_price_cents
  monetize :early_group_price_cents
  monetize :early_student_price_cents

  def label
  	code + " " + course.name + " " + location.city + " " + start_date.strftime("%b %-d, %Y")
  end

end
