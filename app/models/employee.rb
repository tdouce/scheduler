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

 
  def self.elgible_per_shift(shifts)
    
    shift_roles = shifts.map(&:role_ids) 
    shift_names = shifts.map(&:name)
    shift_start_end_times = shifts.map {|shift| [shift.time_start, shift.time_end]}

    elgible_employees = shift_roles.inject([]) do |result, shift_role|
      employees_shuffled = self.elgible_for_shift_by_role( shift_role ).shuffle!
      result << [ employees_shuffled, employees_shuffled[0] ]
      result
    end

    employees_for_shift = shift_names.zip(shift_start_end_times, elgible_employees)

    # Start of code to create nested array that does not have employees double
    # scheduled according to time
    #scheduled_employee = employees_for_shift.map {|shift| shift[2][1] }
    #scheduled_more_than_once = scheduled_employee.map {|employee| employee if scheduled_employee.count(employee) > 1 }.compact.uniq
    #
    #test = []

    #scheduled_employee.each do |employee|
    #  if scheduled_employee.count( employee ) >= 2 
    #    test << scheduled_employee.index( employee.to_s )
    #  end
    #end

    #debugger

    #employees_for_shift
    

  end

  # web-friendly name
  def full_name
    [ self.first_name, self.last_name ].join(" ")
  end

  def days_worked
    self.workdays
  end
  
  private

    # Used as a helper method for self.elgible_per_shift. Returns an array of
    # employees that are elgible to work that shift according to their assigned roles
    def self.elgible_for_shift_by_role(role_ids_for_shift)
      joins(:roles).
      where("roles.id IN(?)", role_ids_for_shift ).
      collect(&:full_name).uniq.sort
    end


end
