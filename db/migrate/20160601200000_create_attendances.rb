class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
    	# There is one record for each day that the student
    	# attended the training.
    	t.belongs_to :student, index: true
    	t.belongs_to :training, index:true
    	t.date :date
    	t.text :notes
      	t.timestamps
    end
  end
end
