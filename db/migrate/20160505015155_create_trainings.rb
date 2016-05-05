class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.date :start_date
      t.date :end_date
      t.string :code
      t.decimal :early_cost, precision: 8, scale: 2
      t.decimal :late_cost, precision: 8, scale: 2
      t.decimal :staff_cost, precision: 8, scale: 2
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
