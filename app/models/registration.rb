class Registration < ApplicationRecord

  belongs_to :registerable, polymorphic: true
  belongs_to :training

  validates :code, presence: true
  validates :training_id, presence: true
  validates :registerable_type, presence: true
  validates :registerable_id, presence: true

  # Used internally by simple form.
  def student_id
  	registerable.class.name == "Student" ? registerable.id : nil
  end

  # Used internally by simple form.
  def group_id
  	registerable.class.name == "Group" ? registerable.id : nil
  end

end
