class Schedule < ActiveRecord::Base

  attr_accessible :schedule_id, :date, :day_id

  belongs_to :day
  has_many   :workdays

  validates :date, :presence => true,
            :uniqueness => true

  # The number of employees who worked this day
  def number_employees_today
    self.workdays.map {|workday| workday.employee_id }.uniq.length
  end

end
