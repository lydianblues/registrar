class CreateGroupDatatables < ActiveRecord::Migration[5.0]
  def self.up

		execute <<-SQL
			create view group_datatables as
				select * from groups
		SQL

	end

	def self.down
		execute <<-SQL
			drop view group_datatables
		SQL
	end
end
