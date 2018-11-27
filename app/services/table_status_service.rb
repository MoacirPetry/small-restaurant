class TableStatusService
  def self.change_status_to_true(table_id)
    Table.find(table_id).update_attribute(:status, true)
  end
  def self.change_status_to_false(table_id)
    Table.find(table_id).update_attribute(:status, false)
  end
end
