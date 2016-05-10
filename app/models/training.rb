class Training < ApplicationRecord
  belongs_to :course
  belongs_to :facilitator
  belongs_to :location

  def label
  	code + " " + course.name + " " + location.city + " " + start_date.strftime("%b %-d, %Y")
  end

end
