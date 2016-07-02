class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :registerable, polymorphic: true, index: true
      t.references :training, index: true
      t.integer :code
      t.boolean :paid_for, default: false
      t.integer :amt_paid_cents, default: 0
      t.date :sign_up_date
      t.string :auth_code
      t.boolean :refunded
      t.string :reg_type
      t.references :owner, index:true
      t.timestamps
    end
  end
end
