class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :registerable, polymorphic: true
      t.references :training
      t.integer :code
      t.boolean :paid_for
      t.decimal :amt_paid, precision: 8, scale: 2
      t.date :sign_up_date
      t.string :auth_code
      t.boolean :refunded

      t.timestamps
    end
  end
end
