class CreateGroupHandleSeq < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
    	CREATE SEQUENCE group_handle_seq;
	SQL
  end

  def down
  	execute <<-SQL
		 DROP SEQUENCE group_handle_seq;
	SQL
	end
	
end
