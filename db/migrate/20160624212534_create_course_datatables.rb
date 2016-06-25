class CreateCourseDatatables < ActiveRecord::Migration[5.0]
 
  	def self.up

		execute <<-SQL
			create view course_datatables as
				select name as course, description, id as course_id from courses
		SQL

	end

	def self.down
		execute <<-SQL
			drop view course_datatables
		SQL
	end

end
