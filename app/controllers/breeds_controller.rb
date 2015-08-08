class BreedsController < ApplicationController
  respond_to :json, :html

  def index
    @breeds = Breed.all

    
    respond_with @breeds
  end

  def show
    @breed = Breed.find(params[:id])
    @dogs = @breed.dogs

    response = {:breed => @breed, :dogs => @dogs}

    respond_with response
  end
end
