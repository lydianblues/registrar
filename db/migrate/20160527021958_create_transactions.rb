class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
    	t.references :registration
    	t.references :owner
      t.timestamps
    end
  end
end
