class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.integer :employee_id
      t.integer :shift_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
