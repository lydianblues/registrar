class CreateRegistrants < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
		CREATE OR REPLACE FUNCTION registrant_name(registerable_type varchar, registerable_id integer)
			RETURNS varchar AS $$
			
			DECLARE
				student_row students%ROWTYPE;
			    group_row groups%ROWTYPE;
			BEGIN
                IF registerable_type = 'Student'
                THEN
					SELECT * INTO student_row FROM students s WHERE s.id = registerable_id;
					RETURN student_row.wp_first_name || ' ' || student_row.wp_last_name;
                ELSE
					SELECT * INTO group_row FROM groups g WHERE g.id = registerable_id;
                    SELECT * INTO student_row FROM students s WHERE s.id = group_row.student_id;
					RETURN student_row.wp_last_name || '#' || group_row.id;
				END IF;
			END;
			$$ LANGUAGE plpgsql;
	SQL
  end

  def down
  	execute <<-SQL
		 DROP function IF EXISTS registrant_name(varchar, integer);
	SQL
	end
	
end
