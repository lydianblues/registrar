json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@transactions) do |transaction|

		json.payment_transaction_id raw render(template: 'transactions/_transaction.html.erb',
			locals: {pid: transaction.payment_transaction_id, id:transaction.transaction_id })

		json.registration_code raw render(template: 'transactions/_registration.html.erb',
			locals: {code: transaction.registration_code, id: transaction.registration_id })

		json.owner_name raw render(template: 'transactions/_owner.html.erb',
			locals: {name: transaction.owner_name, id: transaction.owner_id })

		json.registerable_name raw render(template: 'transactions/_registerable.html.erb',
			locals: {name: transaction.registerable_name,
				registerable_id: transaction.registerable_id,
				registerable_type: transaction.registerable_type})

		json.extract! transaction, :payment_type, :status, :payer_name, :amount, :created_at, :updated_at
		
		json.refresh_button raw render(template: 'transactions/_refresh_button.html.erb',
			locals: {tid: transaction.transaction_id})
	end
end