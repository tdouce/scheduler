class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :day_id
      t.integer :shift_id

      t.timestamps
    end
  end
end
