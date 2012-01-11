class Shift < ActiveRecord::Base

  # Should have to have :employee_ids to assign employees to a shift
  attr_accessible :name, :time_start, :time_end, :employee_ids, :role_ids
  #attr_accessor :day_of_week_template_name

  has_many  :workdays
  has_many  :employees, :through => :workdays

  has_many  :assignments
  has_many  :days, :through => :assignments

  has_many  :shiftroles
  has_many  :roles, :through => :shiftroles

  validates :name, :presence => true,
            :uniqueness => true
  validates :time_start, :presence => true
  validates :time_end, :presence => true

  def roles_assigned_to_shift( for_print )
    self.roles.empty? ? for_print : self.roles.map { |role| role.name }.join(", ") 
  end

end
