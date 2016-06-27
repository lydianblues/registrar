class CreateTransactionDatatables < ActiveRecord::Migration[5.0]
  def self.up

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


	        create view transaction_datatables as

				select

		        id transaction_id,

		        registration_id,

		        transaction_id as payment_transaction_id,

		        (select r.code::text from registrations r
		         where r.id = outer_t.registration_id) as registration_code,

		        (select s.wp_first_name || ' ' || s.wp_last_name
		                from students s
		                join registrations r on r.owner_id = s.id
		                where r.id = outer_t.registration_id) as owner_name,

		        (select s.id
		                from students s
		                join registrations r on r.owner_id = s.id
		                where r.id = outer_t.registration_id) as owner_id,

		        (select rt.name
		                from registrations r join registrants rt
		                on (r.registerable_id = rt.registerable_id
		                and r.registerable_type = rt.registerable_type)
		                where r.id = outer_t.registration_id)
		                as registerable_name,

		        (select r.registerable_id
		                from registrations r
		                where r.id = outer_t.registration_id)
		                as registerable_id,

		        (select r.registerable_type
		                from registrations r
		                where r.id = outer_t.registration_id)
		                as registerable_type,

		        status,

		        CASE
		             WHEN payment_instrument_type = 'paypal_account' THEN
		                'PayPal'
		             ELSE
		                'Credit Card'
		             END AS payment_type,

		        CASE
		             WHEN payment_instrument_type = 'paypal_account' THEN
		                payer_first_name || ' ' || payer_last_name
		             ELSE
		                CASE
		                    WHEN (billing_last_name IS NULL)
		                    OR (billing_first_name IS NULL) THEN
		                        'Unspecified'
		                    ELSE
		                        billing_first_name || ' ' || billing_last_name
		                    END
		            END AS payer_name,

		        '$' || amount::text AS amount,

		        to_char(created_at, 'MM/DD/YYYY HH:MI AM') as created_at,

		        to_char(updated_at, 'MM/DD/YYYY HH:MI AM') as updated_at

		        from transactions outer_t;
				
		SQL

	end

	def self.down
		execute <<-SQL
			drop view if exists transaction_datatables;
			drop view if exists registrants;
		SQL
	end

end
