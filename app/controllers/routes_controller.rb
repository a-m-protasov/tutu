class RoutesController < ApplicationController

  before_action :set_train, only: [:show]

  def index
    @routes = Route.all
  end

  def show

  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])

    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:name)
  end

  def set_route
    @route = Route.find(params[:id])
  end  
end
