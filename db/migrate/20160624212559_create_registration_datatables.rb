class CreateRegistrationDatatables < ActiveRecord::Migration[5.0]

	def self.up

		execute <<-SQL
			create or replace view registration_datatables as
				select outer_r.code as

			        registration_code,

			        (select c.name from registrations r
			                join trainings t on r.training_id = t.id
			                join courses c on t.course_id = c.id
			                where r.id = outer_r.id)
			        as course_name,

			        (select c.id from registrations r
			                join trainings t on r.training_id = t.id
			                join courses c on t.course_id = c.id
			                where r.id = outer_r.id)
			        as course_id,

			        (select t.code from registrations r
			                join trainings t on r.training_id = t.id
			                where r.id = outer_r.id
			        ) as training_code,

			        (select t.id from registrations r
			                join trainings t on r.training_id = t.id
			                where r.id = outer_r.id
			        ) as training_id,

			        (select s.wp_first_name || ' ' || s.wp_last_name
			                from registrations r
			                join students s on r.owner_id = s.id
			                where r.id = outer_r.id
			        ) as owner_name,

			        (select s.id
			                from registrations r
			                join students s on r.owner_id = s.id
			                where r.id = outer_r.id
			        ) as owner_id,

			        case when registerable_type = 'Student' then
			                (select s.wp_first_name || ' ' || s.wp_last_name
			                        from registrations r join
			                        students s on r.registerable_id = s.id
			                        where r.id = outer_r.id)
			        else
			                (select s.wp_last_name || '#' || g.id
			                        from registrations r
			                        join groups g on r.registerable_id = g.id
			                        join students s on g.student_id = s.id
			                        where r.id  = outer_r.id)
			        end as registrant,

			        registerable_type as registerable_type,

			        registerable_id as registerable_id,

			        case when paid_for is TRUE then 'Yes' ELSE 'No' END as paid_for,

			        to_char(updated_at, 'MM/DD/YYYY HH:MI AM') as updated_at,

			        id as registration_id

				from registrations outer_r

		SQL

	end

	def self.down
		execute <<-SQL
			drop view if exists registration_datatables
		SQL
	end

end
