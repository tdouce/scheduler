class SchedulesController < ApplicationController
  # used to generate a html form for new shift
  def new
    @schedule = Schedule.new
    @day_templates = Day.order("name asc")
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



  def update
  end

  def edit
  end

  def destroy
  end

end
