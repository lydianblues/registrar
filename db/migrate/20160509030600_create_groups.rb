class CreateGroups < ActiveRecord::Migration[5.0]
  def change
   	create_table :groups do |t|
		t.references :leader, foreign_key: true # student, really
      	t.string :leader_first
      	t.string :leader_last
      	t.string :tag
      	t.timestamps
    end
  end
end
