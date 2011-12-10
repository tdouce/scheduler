class PagesController < ApplicationController

  def dashboard
    @employees = Employee.all
    @roles = Role.all
  end

end
