require 'datatables_query'

class RegistrationDatatable < ApplicationRecord

	extend ::DataTables::Query

  # Please fix me
  def updated_local_time
    updated_at.in_time_zone('Pacific Time (US & Canada)').strftime('%m/%d/%Y %l:%M %p')
  end

end
