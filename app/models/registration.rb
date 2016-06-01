class Registration < ApplicationRecord

  belongs_to :registerable, polymorphic: true
  belongs_to :training
  belongs_to :owner, class_name: Student
  has_many :transactions

  validates :code, presence: true
  validates :training, presence: true
  validates :registerable, presence: true

  def price

    total_price = 0 # cents
    price = 0 # cents

    # Registration.find(4).registerable.students.count has 7 students...
    # Registration.find(5).registerable.students.count has 4 students...

    group_price = training.group_price
    regular_price = training.regular_price
    student_price = training.student_price
    min_price = [group_price, student_price].min
    min_group_size = training.min_group_size

    if registerable_type == "Group"

      group_discount_available =
        (registerable.students.count >= min_group_size)

      registerable.students.each do |student|
        if group_discount_available
          if student.student_discount
            price += min_price
          else
            price += group_price
          end
        else
          if student.student_discount
            price += student_price
          else
            price += price + regular_price
          end
        end
      end
    else
      # Student, not a Group
      student = registerable
      if student.student_discount
        price += student_price
      else
        price += regular_price
      end
    end
    return price
  end

  # Convert 2048 to $20.48, for example.
  def formatted_price
    price.to_s.sub(/^(.*)(..)$/, '$\1.\2')
  end

  # Used internally by simple form.
  def student_id
  	registerable.class.name == "Student" ? registerable.id : nil
  end

  # Used internally by simple form.
  def group_id
  	registerable.class.name == "Group" ? registerable.id : nil
  end

end
