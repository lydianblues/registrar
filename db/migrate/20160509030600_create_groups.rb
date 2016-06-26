class CreateGroups < ActiveRecord::Migration[5.0]
  def change
   	create_table :groups do |t|
		t.references :student, foreign_key: true # student, really, creator
      	t.string :tag
      	t.references :organization, foreign_key: true
      	t.timestamps
    end
  end
end
