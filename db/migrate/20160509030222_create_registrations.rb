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
      t.boolean :refunded, default: false # Not used
      t.date :refunded_at
      t.integer :amt_refunded_cents, default: 0
      t.string :refund_transaction_id
      t.boolean :canceled, default: false # Not used
      t.date :cancelled_at
      t.text :notes
      t.string :reg_type
      t.references :owner, index:true
      t.timestamps
    end
  end
end
