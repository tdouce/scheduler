class CreateShiftroles < ActiveRecord::Migration
  def change
    create_table :shiftroles do |t|
      t.integer :shift_id
      t.integer :role_id

      t.timestamps
    end
  end
end
