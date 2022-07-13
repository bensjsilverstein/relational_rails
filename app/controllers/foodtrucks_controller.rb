class FoodtrucksController < ApplicationController
  def index
    @foodtrucks = Foodtruck.all
  end

  def show
    @foodtruck = Foodtruck.find(params[:id])
  end

  def new
  end

  def create
    Foodtruck.create!(
      name:         params[:name],
      num_workers:  params[:num_workers],
      checked_in:   params[:checked_in],
      food_type:    params[:food_type])
    redirect_to '/foodtrucks'
  end

  def edit
   @foodtruck = Foodtruck.find(params[:id])
  end

  def update
    foodtruck = Foodtruck.find(params[:id])
    foodtruck.update(foodtruck_params)
    foodtruck.save
    redirect_to "/foodtrucks/#{foodtruck.id}"
  end

  def destroy
    Foodtruck.destroy(params[:id])
    redirect_to '/foodtrucks'
  end

  private
  def foodtruck_params
    params.permit(:name, :num_workers, :checked_in, :food_type)
  end

end
