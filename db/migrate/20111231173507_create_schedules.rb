class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :date
      t.integer :day_id

      t.timestamps
    end
  end
end
