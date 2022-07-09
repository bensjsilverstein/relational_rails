class FoodtrucksController < ApplicationController
  def index
    @foodtrucks = Foodtruck.all
  end

  def show
    @foodtruck = Foodtruck.find(params[:id])
  end
end
