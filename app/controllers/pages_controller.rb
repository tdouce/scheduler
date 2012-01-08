class PagesController < ApplicationController

  def dashboard
    @employees = Employee.all
    @roles = Role.all
    @scheduled_days = Schedule.order("date asc")
  end

end
