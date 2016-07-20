class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :registerable, polymorphic: true, index: true
      t.references :training, index: true
      t.integer :code
      t.boolean :paid_for, default: false
      t.date :sign_up_date
      t.date :cancelled_at
      t.text :notes
      t.string :reg_type
      t.references :owner, index:true
      t.timestamps
    end
  end
end
