class PagesController < ApplicationController
  def dashboard
    @employees = Employee.all
  end

end
