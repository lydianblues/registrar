class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :registration
    	t.references :owner

      t.string :status
      t.string :payment_instrument_type
      t.decimal :amount, precision: 8, scale: 2, default: 0.00 # as returned from BrainTree
      t.string :transaction_id
      t.string :transaction_type
      t.string :customer_id
      t.string :processor_authorization_code
      t.string :processor_response_code
      t.string :processor_response_text
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :billing_first_name
      t.string :billing_last_name

      # For Paypal
      t.string :authorization_id
      t.string :capture_id
      t.string :payer_first_name
      t.string :payer_last_name
      t.string :payer_id
      t.string :payment_id
      t.string :transaction_fee_amount

      # For Credit Cards
      t.string :bin
      t.string :card_type
      t.string :cardholder_name
      t.string :last_4

      t.timestamps
    end
  end
end
