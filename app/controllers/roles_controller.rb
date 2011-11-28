class RolesController < ApplicationController

  def index
  end

  def new
    @role = Role.new(params[:role])
  end

  def create
    @role = Role.new(params[:role])
  end


  def update
  end

  def edit
  end

  def show
  end

end
