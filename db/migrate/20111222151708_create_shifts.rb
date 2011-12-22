class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :employee_id
      t.integer :role_id
      t.date :date_start
      t.date :date_end
      t.time :time_start
      t.time :time_end
      t.string :template_name
      t.boolean :is_template

      t.timestamps
    end
  end
end
