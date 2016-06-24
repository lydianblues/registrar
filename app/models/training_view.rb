require 'datatables_query'

class TrainingView < ApplicationRecord

	self.table_name = "trainings_view"
	extend ::DataTables::Query

end
