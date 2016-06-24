# Put this in a YAML config file.
Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = 'n4zyq6yr2t5k66cx'
Braintree::Configuration.public_key = '8q2c4q5bj9sxkhjk'
Braintree::Configuration.private_key = '045e6ad4a8e9e977642fe5787037e279'

require 'datatables_query'

class Transaction < ApplicationRecord
	belongs_to :registration
	belongs_to :owner, class_name: 'Student'

	extend ::DataTables::Query

	def setup(bt_tid)

		# May throw Braintree::NotFoundError and other errors.
		transaction = Braintree::Transaction.find(bt_tid)

		self.transaction_id = transaction.id
		self.status =  transaction.status
		self.payment_instrument_type = transaction.payment_instrument_type

		# You can print out a string using: '%.2f' % t.amount, or as cents
		# using  '%.0f' % (t.amount * 100).
		self.amount = transaction.amount #big decimal
		self.transaction_id = transaction.id
		self.transaction_type = transaction.type
		self.customer_id = transaction.customer_details.id
		self.processor_authorization_code = transaction.processor_authorization_code
		self.processor_response_code = transaction.processor_response_code
		self.processor_response_text = transaction.processor_response_text
		self.customer_first_name = transaction.customer_details.first_name
		self.customer_last_name = transaction.customer_details.last_name
		self.billing_first_name = transaction.billing_details.first_name
		self.billing_last_name = transaction.billing_details.last_name

		if transaction.payment_instrument_type == 'paypal_account'
			paypal_details = transaction.paypal_details
			self.authorization_id = paypal_details.authorization_id
			self.capture_id = paypal_details.capture_id
			self.payer_first_name = paypal_details.payer_first_name
			self.payer_last_name = paypal_details.payer_last_name
			self.payer_id = paypal_details.payer_id
			self.payment_id = paypal_details.payment_id
			self.transaction_fee_amount = paypal_details.transaction_fee_amount
		else
			self.bin = transaction.credit_card_details.bin
			self.card_type = transaction.credit_card_details.card_type
			self.cardholder_name = transaction.credit_card_details.cardholder_name
			self.last_4 = transaction.credit_card_details.last_4
		end
		return transaction.amount.class.name
	end

	def refresh
		setup(transaction_id)
		save!
	end

	# Things below here should be in view helpers....
	def payer_name
		if payment_instrument_type == 'paypal_account'
			return payer_first_name + " " + payer_last_name
		else
			if billing_last_name.nil? || billing_first_name.nil?
				return "Unspecified"
			else
				return billing_first_name + " " + billing_last_name
			end
		end
	end

	def short_status
		short_status = status
		if status == 'submitted_for_settlement'
			short_status = 'settling'
		end
		short_status
	end

	# Please fix me
	def updated_local_time
		updated_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %H:%M')
	end

	# Please fix me
	def created_local_time
		created_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %H:%M')
	end
end
