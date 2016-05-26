class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :wp_first_name
      t.string :wp_last_name
      t.string :wp_email
      t.integer :wp_id
      t.string :occupation
      t.string :organization
      t.string :wp_login
      t.string :wp_display_name
      t.boolean :email_list

      t.timestamps
    end
  end
end
