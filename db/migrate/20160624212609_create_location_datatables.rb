class CreateLocationDatatables < ActiveRecord::Migration[5.0]
  def self.up

		execute <<-SQL
			create view location_datatables as
				select name as location_name,
					id as location_id,
					city 
				from locations;
		SQL

	end

	def self.down
		execute <<-SQL
			drop view location_datatables
		SQL
	end
end
