class AddNameToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :name, :string
  end
end
