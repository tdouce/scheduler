class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :employee_id
      t.integer :role_id
      t.datetime :dt_start
      t.datetime :dt_end_
      t.string :template_name

      t.timestamps
    end
  end
end
