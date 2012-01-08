class Employee < ActiveRecord::Base

  # Have to make these attributes accessible to insert into join table (employments)
  # Have to have :role_ids to assign roles to an employee 
  attr_accessible :first_name, :last_name, :role_ids, :shift_ids
  #:role_ids, :employee_id,:shift_ids
  
  validates :first_name,  :presence => true
  validates :last_name,   :presence => true

  has_many  :workdays
  has_many  :shifts, :through => :workdays

  has_many  :employments
  has_many  :roles, :through => :employments

  # web-friendly name
  def full_name
    [ self.first_name, self.last_name ].join(" ")
  end

  def days_worked
    self.workdays
  end

end
