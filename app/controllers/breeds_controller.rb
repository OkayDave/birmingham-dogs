class BreedsController < ApplicationController

  def index
    @breeds = Breed.all
  end

  def show
    @breed = Breed.includes(:dogs).find(params[:id])
  end
end
