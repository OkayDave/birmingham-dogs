class SheltersController < ApplicationController


  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @dogs = @shelter.dogs.limit(3)
  end
end
