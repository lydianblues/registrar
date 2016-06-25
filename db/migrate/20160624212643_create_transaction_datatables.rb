class CreateTransactionDatatables < ActiveRecord::Migration[5.0]
  def self.up

		execute <<-SQL
			create view transaction_datatables as
				select * from transactions
		SQL

	end

	def self.down
		execute <<-SQL
			drop view transaction_datatables
		SQL
	end
end
