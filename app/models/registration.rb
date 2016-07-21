require 'datatables_query'

class Registration < ApplicationRecord

    belongs_to :registerable, polymorphic: true
    belongs_to :training
    belongs_to :owner, class_name: Student
    has_many :transactions

    validates :code, presence: true
    validates :training, presence: true
    validates :registerable, presence: true

    attr_accessor :owner_email, :registrant_email, :group_handle, :training_code

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
                @regular_count += 1
            end
        end
        return price.as_us_dollar
    end

    def amount_due
        price
    end
                        
    # Used internally by simple form.
    def student_id
    	registerable.class.name == "Student" ? registerable.id : nil
    end

    # Used internally by simple form.
    def group_id
    	registerable.class.name == "Group" ? registerable.id : nil
    end

    # Please fix me
    def updated_local_time
      updated_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
    end
    
    # Please fix me
    def created_local_time
      created_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
    end

    def cancelled_local_time
        if cancelled_at.nil?
            "Not Cancelled"
        else
            cancelled_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
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
            if t.transaction_type == "sale" && t.status != "voided"
                amt += t.money_amount
            end
        end
        return amt
    end

    # Attempt to account for partial refunds.  Does Braintree generate
    # a new transaction for this?
    def amount_refunded
        amt = Money.new(0)
        transactions.each do |t|
          if t.transaction_type == "refund" && t.status != "voided"
            amt += t.money_amount
          end
        end
        return amt
    end

end
