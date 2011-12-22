class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :employee_id
      t.integer :role_id
      t.time :time_start
      t.time :time_end
      t.string :name

      t.timestamps
    end
  end
end
