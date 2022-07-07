class FoodtrucksController < ApplicationController
  def index
    @foodtrucks = Foodtruck.all
  end
end
