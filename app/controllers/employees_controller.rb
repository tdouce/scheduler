class EmployeesController < ApplicationController

  def index
    # To order the employees by last_name you can remove '.all'
    # and add '.order()'.  The '.all' is implied
    @employees = Employee.order("last_name asc")
  end

  # Individual employees
  def show
    @employee = Employee.find(params[:id])
  end

  # The html form for creating a new employee
  def new 
    # ':employee' get the nested dictionary (i.e. all the form values)
    #@employee = Employee.new(params[:employee])
    @employee = Employee.new
  end

  # POST => database 
  def create 
    # Saving the ':employee' and all the form values, which is in a nested
    # dictionary
    @employee = Employee.new(params[:employee])

    if @employee.save
      flash[:success] = "Employee #{@employee.full_name} was created!"

      # Redirect to employee index
      redirect_to employees_url
    else
      flash[:failure] = "Employee NOT created!"
      render :action => 'new'

      # Why not something like this instead of " render 'new' "?
      #render new_employee_url 
    end
  end

  # PUT => database
  def update
    
    # If employee was submitted with 'no' roles (i.e. no checkboxes where
    # checked) then set employee.role_ids to empty array
    params[:employee][:role_ids] ||= []

    # Find the same employee that was used in the 'edit' action. 
    @employee = Employee.find(params[:id])

    puts '*' * 80
    puts @employee.full_name
    puts '*' * 80

    # If the saving of the employee is successfull
    if @employee.update_attributes(params[:employee])
      flash[:success] = "Employee #{@employee.full_name} was updated"
      redirect_to employees_url
    else
      flash[:failure] = "Employee was NOT updated"
      render 'edit'
    end
  end

  # Used in the html form.
  def edit
    @employee = Employee.find(params[:id])
  end

  # DELETE => database
  def destroy
    employee = Employee.find(params[:id]).destroy
    flash[:success] = "Employee #{employee.full_name} was destroyed."

    redirect_to employees_path
  end

end
