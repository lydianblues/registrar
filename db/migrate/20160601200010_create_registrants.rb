class CreateRegistrants < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
			-- This view is a handy little mapper from a pair
			-- (registerable_id, registerable_type) to the name
			-- for the registerable.
			create view registrants as

		        select

		        case when r.registerable_type = 'Student' then
		            (select s.wp_first_name || ' ' || s.wp_last_name
		            from students s
		            where s.id = r.registerable_id)
		        else
		            (select s.wp_last_name || '#' || g.id::text
		            from students s
		            join groups g on g.student_id = s.id
		            where g.id = r.registerable_id)
		        end as name,

		        registerable_id,

		        registerable_type

	        	from registrations r;
	SQL
  end

  def down
  	execute <<-SQL
		drop view if exists registrants;
	SQL
	end
	
end
