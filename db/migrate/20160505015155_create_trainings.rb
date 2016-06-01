class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.date :start_date
      t.date :end_date
      t.string :code

      t.integer :regular_price # in cents
      t.integer :group_price # in cents
      t.integer :student_price # in cents
      t.integer :early_regular_price # in cents
      t.integer :early_group_price # in cents
      t.integer :early_student_price # in cents
      t.integer :min_group_size, default: 5
      
      t.date :new_registration_closed
      t.date :early_registration_cutoff
      t.integer :min_attendees
      t.integer :max_attendees
      t.references :course, foreign_key: true
      t.references :facilitator, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
