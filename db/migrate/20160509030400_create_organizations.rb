class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
    	t.string :name			# name of the organization
    	t.references :student   # creator of this record
    	t.string :leader		# leader of the organization (full name)
      t.timestamps
    end
  end
end
