class SchedulesController < ApplicationController

  # redirect to root unless user is signed_in
  before_filter :show_page?

  # used to generate a html form for new shift
  def new
    @schedule = Schedule.new
    @day_templates = Day.order("name asc")

    # TAke this out. Just to practive generating code
    @shifts = Schedule.last.day.shifts
  end

  def create
    @schedule = Schedule.new(params[:schedule])

    if @schedule.save
      flash[:success] = "Schedule successfully created!"
      redirect_to schedules_url
    else
      flash[:failure] = "Schedule NOT created!"
      render :action => 'new'
    end
  end

  def index
    @schedules = Schedule.all
  end

  def update
  end

  def edit
  end

  def destroy
    schedule = Schedule.find(params[:id]).destroy
    flash[:success] = "Schedule #{ schedule.date } was destroyed."
    redirect_to schedules_url
  end

end
