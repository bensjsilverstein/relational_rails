class FoodtruckDishesController < ApplicationController
  def index
    @foodtruck = Foodtruck.find(params[:id])
    @dishes = @foodtruck.dishes
    if params[:sort] == "alpha"
      @dishes = @foodtruck.dishes.alphabetical
    elsif params[:cost]
      @dishes = @foodtruck.dishes.where("price < #{params[:cost]}")
    else
      @dishes = @foodtruck.dishes
    end
  end

  def new
    @foodtruck= Foodtruck.find(params[:id])
  end

  def create
    @foodtruck = Foodtruck.find(params[:id])
    @foodtruck.dishes.create(dish_params)
    redirect_to "/foodtrucks/#{@foodtruck.id}/dishes"
  end

  private
  def dish_params
    params.permit(:dish_name, :price, :in_stock)
  end

  # def show
  #   @foodtruck = Foodtruck.find(params[:id])
  #   @dishes = @foodtruck.dishes
  # end


end
