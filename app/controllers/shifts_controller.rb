class ShiftsController < ApplicationController

  # redirect to root unless user is signed_in
  before_filter :show_page?

  def index
    @shifts = Shift.order("name asc")
  end

  # used to generate a html form for new shift
  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(params[:shift])

    if @shift.save
      flash[:success] = "Shift successfully created!"
      redirect_to shifts_url
    else
      flash[:failure] = "Shift NOT created!"
      render :action => 'new'
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    
    params[:shift] ||= []

    @shift = Shift.find(params[:id])

    if @shift.update_attributes(params[:shift])
      flash[:success] = "Shift was updated"
      redirect_to shifts_url
    else
      flash[:failure] = "Shift was NOT updated"
      render 'edit'
    end
  end

  def destroy
    puts '*'*80
    puts '*'*80

    shift = Shift.find(params[:id]).destroy
    flash[:success] = "Shift was destroyed"
    redirect_to shifts_path
    #@shift.destroy
    #redirect_to shifts_path, :flash => { :success => "Shift was destroyed" }
  end

  # Individual employees
  #def show
  #  @shift = Shift.find(params[:id])
  #end




end
