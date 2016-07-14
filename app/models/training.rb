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

  def formatted_regular_price 
  	regular_price.format
  end

  def formatted_regular_price=(price)
  	self.regular_price = price # $ is automagically handled
  end

  def formatted_student_price 
  	student_price.format
  end

  def formatted_student_price=(price)
  	self.student_price = price # $ is automagically handled
  end

  def formatted_group_price 
  	group_price.format
  end

  def formatted_group_price=(price)
  	self.group_price = price # $ is automagically handled
  end

  ##############################################

  def formatted_early_regular_price 
  	early_regular_price.format
  end

  def formatted_early_regular_price=(price)
  	self.early_regular_price = price # $ is automagically handled
  end

  def formatted_early_student_price 
  	early_student_price.format
  end

  def formatted_early_student_price=(price)
  	self.early_student_price = price # $ is automagically handled
  end

  def formatted_early_group_price 
  	early_group_price.format
  end

  def formatted_early_group_price=(price)
  	self.early_group_price = price # $ is automagically handled
  end

  def signups
  	total = 0
  	self.registrations.each do |r|
  		if r.registerable_type == "Student"
  			total += 1
  		else
  			total += r.registerable.students.count
  		end
  	end
  	total
  end

  def label
    if online
      code + " " + course.name + " (Online)"
    else
  	 code + " " + course.name + " " + location.city + " " +
      start_date.strftime("%b %-d, %Y")
    end
  end

end
