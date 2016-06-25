class CreateOrganizationDatatables < ActiveRecord::Migration[5.0]
 def self.up

		execute <<-SQL
			create view organization_datatables as
				select * from organizations
		SQL

	end

	def self.down
		execute <<-SQL
			drop view organization_datatables
		SQL
	end
end
