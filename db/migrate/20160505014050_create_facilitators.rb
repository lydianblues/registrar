class CreateFacilitators < ActiveRecord::Migration[5.0]
  def change
    create_table :facilitators do |t|
      t.string :name
      t.string :email
      t.string :home_city
      t.text :description

      t.timestamps
    end
  end
end
