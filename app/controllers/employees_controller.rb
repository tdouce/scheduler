class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  # The html form for creating a new employee
  def new 

    # ':employee' get the nested dictionary (i.e. all the form values)
    @employee = Employee.new(params[:employee])

  end

  def update
    @employee = Employee.find(params[:id])
  end

  def destroy
    Employee.find(params[:id]).destroy
    flash[:success] = "Employee was destroyed."

    # Redirect to index page
    redirect_to employees_path

  end

  # The POST http verb for the actual creation of a new employee
  def create 
    @employee = Employee.new(params[:employee])

    if @employee.save

      flash[:success] = "Employee created!"
      # Redirect to employee index
      redirect_to employees_url
    else
      flash[:failure] = "Employee NOT created!"
      render :action => 'new'

      # Why not something like this instead of " render 'new' "?
      #render new_employee_url 
    end

  end

  # Individual employees
  def show
    @employee = Employee.find(params[:id])
  end

  def edit
  end

  def update
  end





end
