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
      t.boolean :student_discount, default: false

      t.index :wp_first_name
      t.index :wp_last_name
      t.index :wp_email
      t.index :occupation
      t.index :organization

      t.timestamps
    end
  end
end
