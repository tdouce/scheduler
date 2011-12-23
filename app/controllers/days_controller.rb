class DaysController < ApplicationController
 
  # redirect to root unless user is signed_in
  before_filter :show_page?

  def index
    @days = Day.order("name asc")
  end

  # used to generate a html form for new shift
  def new
    @day = Day.new
  end

  def create
    @day = Day.new(params[:day])

    if @day.save
      flash[:success] = "Day successfully created!"
      redirect_to shifts_url
    else
      flash[:failure] = "Day NOT created!"
      render :action => 'new'
    end
  end

  def edit
    @day = Day.find(params[:id])
  end

  def update
    
    params[:shift] ||= []

    @day = Day.find(params[:id])

    if @day.update_attributes(params[:day])
      flash[:success] = "Day was updated"
      redirect_to days_url
    else
      flash[:failure] = "Day was NOT updated"
      render 'edit'
    end
  end

  def destroy
    day = Day.find(params[:id]).destroy
    flash[:success] = "Day was destroyed"
    redirect_to days_path
  end



end
