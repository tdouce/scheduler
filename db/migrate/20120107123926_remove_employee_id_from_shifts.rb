class RemoveEmployeeIdFromShifts < ActiveRecord::Migration
  def up
    remove_column :shifts, :employee_id
  end

  def down
    add_column :shifts, :employee_id, :integer
  end
end
