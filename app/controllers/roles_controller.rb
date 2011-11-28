class RolesController < ApplicationController

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new(params[:role])
  end

  def create
    @role = Role.new(params[:role])

    if @role.save
      flash[:success] = "Role successfully created!"
      redirect_to roles_url
    else
      flash[:failure] = "Rose NOT created."
      render 'new'
    end
  end


  def update
  end

  def edit
  end

  def show
  end

  def destroy
    role = Role.find(params[:id]).destroy 
  end

end
