class RemoveRoleIdFromShifts < ActiveRecord::Migration
  def up
    remove_column :shifts, :role_id
  end

  def down
    add_column :shifts, :role_id, :integer
  end
end
