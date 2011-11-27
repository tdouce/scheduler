class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :role_id
      t.integer :employee_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
