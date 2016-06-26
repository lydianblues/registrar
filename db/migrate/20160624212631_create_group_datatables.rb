class CreateGroupDatatables < ActiveRecord::Migration[5.0]
  def self.up

		execute <<-SQL
			create view group_datatables as

				select

				(select s.wp_last_name || '#' || outer_g.id
					from students s
					where s.id = outer_g.student_id) as name,

				id as group_id,

				(select s.wp_first_name || ' ' || s.wp_last_name
			        from students s            
                    where s.id = outer_g.student_id) as owner,

               	student_id as owner_id,

                (select o.name 
                    from organizations o
                    where o.id = outer_g.organization_id) as organization,

                organization_id,

                (select count(*)::text
                    from groups_students gs
                    where gs.group_id = outer_g.id) as count

				from groups outer_g
		SQL

	end

	def self.down
		execute <<-SQL
			drop view group_datatables
		SQL
	end
end
