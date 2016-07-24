require 'datatables_query'

class TransactionDatatable < ApplicationRecord

	extend ::DataTables::Query

 # Please fix me
  def created_local_time
    created_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
  end

 # Please fix me
  def updated_local_time
    updated_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
  end

end
