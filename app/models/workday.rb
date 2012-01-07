class Workday < ActiveRecord::Base
  attr_accessible :employee_id, :shift_id, :schedule_id 

  belongs_to  :employee
  belongs_to  :shift
  belongs_to  :schedule
end
