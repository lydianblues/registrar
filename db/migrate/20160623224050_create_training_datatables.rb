class CreateTrainingDatatables < ActiveRecord::Migration[5.0]
	def self.up

		execute <<-SQL
			create view training_datatables as
			select
				t.id as "training_id",
				c.id as "course_id",
				c.name as "course",
				t.code as "code",
				to_char(t.start_date, 'MM/DD/YYYY') as start,
				to_char(t.end_date, 'MM/DD/YYYY') as end,
				l.city as city
			from trainings t join courses c on t.course_id = c.id
			join locations l on t.location_id = l.id
		SQL

	end

	def self.down
		execute <<-SQL
			drop view training_datatables
		SQL
	end

end
