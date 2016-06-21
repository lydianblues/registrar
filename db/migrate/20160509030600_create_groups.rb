class CreateGroups < ActiveRecord::Migration[5.0]
  def change
   	create_table :groups do |t|
		t.references :student, foreign_key: true # student, really
      	t.string :tag
      	t.timestamps
    end
  end
end
