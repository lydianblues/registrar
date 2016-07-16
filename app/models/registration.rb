require 'datatables_query'

class Registration < ApplicationRecord

  belongs_to :registerable, polymorphic: true
  belongs_to :training
  belongs_to :owner, class_name: Student
  has_many :transactions

  validates :code, presence: true
  validates :training, presence: true
  validates :registerable, presence: true

  monetize :amt_paid_cents
  monetize :amt_refunded_cents

  extend ::DataTables::Query

  def price
    
    price = 0 # cents
    @group_count = 0
    @regular_count = 0
    @student_count = 0

    # Registration.find(4).registerable.students.count has 7 students...
    # Registration.find(5).registerable.students.count has 4 students...
    
    regular_price = training.regular_price

    if training.student_price.blank?
      student_price = regular_price
    else
      student_price = training.student_price
    end
   
    if registerable_type == "Group"
      group_price = training.group_price
      if group_price.blank?
        group_price = regular_price
      end

      min_group_size = training.min_group_size

      group_discount_available =
        (registerable.students.count >= min_group_size)

      registerable.students.each do |student|
        if group_discount_available
          if student.student_discount
            if student_price <= group_price
              @student_count += 1
              price += student_price
            else
              @group_count += 1
              price += group_price
            end
          else
            price += group_price
            @group_count += 1
          end
        else
          if student.student_discount
            price += student_price
            @student_count += 1
          else
            price += regular_price
            @regular_count += 1
          end
        end
      end
    else
      # Student, not a Group
      student = registerable
      if student.student_discount
        price += student_price
        @student_count += 1
      else
        price += regular_price
        @regular_price += 1
      end
    end
      return price.as_us_dollar
    # return 200000 # for testing failed transactions
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

  def amt_approved
    approved = 0.0
    transactions.each do |t|
      if t.processor_response_code == "1000"
        approved += t.amount
      end
    end
    Money.new(approved) * 100
  end

  def amt_refunded
    Money.new(amt_refunded_cents)
  end

  # Please fix me
  def updated_local_time
    updated_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
  end
  
  # Please fix me
  def created_local_time
    created_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
  end

   # Please fix me
  def refunded_local_time
    if refunded_at.nil?
      "Not Refunded"
    else
      refunded_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
    end
  end

  def cancelled_local_time
    if cancelled_at.nil?
      "Not Cancelled"
    else
      refunded_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
    end
  end

  def regular_count
    self.price unless @regular_count
    @regular_count
  end

  def group_count
     self.price unless @group_count
     @group_count
  end

  def student_count
    self.price unless @group_count
    @student_count
  end

  def amount_charged
    amt = Money.new(0)
    transactions.each do |t|
      if t.transaction_type == "sale"
        amt += t.money_amount
      end
    end
    return amt
  end

    def amount_refunded
    amt = Money.new(0)
    transactions.each do |t|
      if t.transaction_type == "refund"
        amt += t.money_amount
      end
    end
    return amt
  end

end
