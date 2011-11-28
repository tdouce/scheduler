class RolesController < ApplicationController

  def index
    @roles = Role.order('name asc')
  end

  # for html form
  def new
    @role = Role.new(params[:role])
  end

  #  POST => database
  def create
    @role = Role.new(params[:role])

    if @role.save
      flash[:success] = "Role successfully created!"
      redirect_to roles_url
    else
      flash[:failure] = "Role NOT created."
      render 'new'
    end
  end

  # PUT => database
  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(params[:role])
      flash[:success] = "Role successfully updated!"
      redirect_to roles_url
    else
      flash[:failure] = "Role NOT updated."
      render 'new'
    end
  end

  # for html form
  def edit
    @role = Role.find(params[:id])
  end

  def show
    @role = Role.find(params[:id])
  end

  # DELETE => database
  def destroy
    role = Role.find(params[:id]).destroy 
    redirect_to roles_url
  end

end
