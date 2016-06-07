class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :registration
    	t.references :owner

      t.string :paymentInstrumentType
      t.string :status
      t.string :processorAuthorizationCode # credit_card
      t.string :authorizationId # paypal
      t.string :amount # as returned from BrainTree

      t.timestamps
    end
  end
end
