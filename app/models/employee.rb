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

  # Used to populate the drop down for a specific shift on index with employees
  # that are elgible to work that shift according to their assigned roles
  def self.elgible_for_shift(role_ids_for_shift)
    joins(:roles).
    where("roles.id IN(?)", role_ids_for_shift ).
    #group_by("employee.id")
    collect(&:full_name).uniq.sort
  end

  # web-friendly name
  def full_name
    [ self.first_name, self.last_name ].join(" ")
  end

  def days_worked
    self.workdays
  end

end
