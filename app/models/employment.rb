class Employment < ActiveRecord::Base

  # Have to make these attributes accesible to insert into join table (employments)
  attr_accessible :employee_id, :role_id

  belongs_to :employee
  belongs_to :role

end
