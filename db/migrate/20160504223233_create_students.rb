class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :wp_user_email
      t.string :wp_id
      t.string :occupation
      t.string :organization
      t.string :wp_user_login
      t.string :wp_display_name

      t.timestamps
    end
  end
end
