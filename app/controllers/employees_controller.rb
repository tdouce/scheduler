class EmployeesController < ApplicationController
  def create
    
    @employee = Employee.create(params[:employee])

    # Use this later so that we can check to see if the save was successful
    # (i.e. that all the validations passed, I think) and then handle an
    # unsuccessful save
    #@employee = Employee.new(params[:employee])
    #if @employee.save
    #  redirect_to @employee
    #else
    #  render :action => 'new'
    #end
  end

end
