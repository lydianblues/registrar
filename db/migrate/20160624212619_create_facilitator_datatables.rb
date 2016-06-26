class CreateFacilitatorDatatables < ActiveRecord::Migration[5.0]
  
  def self.up

		execute <<-SQL
			create view facilitator_datatables as
				select name, email,
					description,
					home_city,
					id as facilitator_id	
				from facilitators;
		SQL

	end

	def self.down
		execute <<-SQL
			drop view facilitator_datatables
		SQL
	end

end
