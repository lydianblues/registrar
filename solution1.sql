

create or replace view registrants2 as

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

	        	from registrations r
                        group by registerable_id, registerable_type;


select rt.name
		                from registrations r join registrants2 rt
		                on (r.registerable_id = rt.registerable_id
		                and r.registerable_type = rt.registerable_type)
		                where r.id = 1;
