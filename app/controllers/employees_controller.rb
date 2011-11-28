class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  # Individual employees
  def show
    @employee = Employee.find(params[:id])
  end

  # The html form for creating a new employee
  def new 
    # ':employee' get the nested dictionary (i.e. all the form values)
    @employee = Employee.new(params[:employee])
  end

  # The POST http verb for the actual creation of a new employee
  def create 
    # Saving the ':employee' and all the form values, which is in a nested
    # dictionary
    @employee = Employee.new(params[:employee])

    if @employee.save
      flash[:success] = "Employee #{ @employee.full_name} was created!"

      # Redirect to employee index
      redirect_to employees_url
    else
      flash[:failure] = "Employee NOT created!"
      render :action => 'new'

      # Why not something like this instead of " render 'new' "?
      #render new_employee_url 
    end
  end

  # Used in the PUT http request to actually update the employee in the datbase
  def update
    # Find the same employee that was used in the 'edit' action. 
    @employee = Employee.find(params[:id])

    # If the saving of the employee is successfull
    if @employee.update_attributes(params[:employee])
      flash[:success] = "Employee #{@employee.full_name} was updated"
      redirect_to employees_url
    else
      flash[:failure] = "Employee was NOT updated"
      render 'edit'
    end
  end

  # Used in the html form. Find the employee and it's attributes
  def edit
    @employee = Employee.find(params[:id])
  end

  def destroy
    employee = Employee.find(params[:id]).destroy
    flash[:success] = "Employee #{employee.full_name} was destroyed."

    # Redirect to index page
    redirect_to employees_path
  end

end
