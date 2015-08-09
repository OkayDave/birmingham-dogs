class BreedsController < ApplicationController
  respond_to :json, :html

  def index
    @breeds = Breed.all

    
    respond_with @breeds do |format|
      format.html
      format.json { render json: {breeds: @breeds}}
    end

  end

  def show
    @breed = Breed.find(params[:id])
    @dogs = @breed.dogs

    respond_with @breed do |format|
      format.html
      format.json { render json: { breed: @breed }}
    end
  end
end
