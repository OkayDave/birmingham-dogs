class SheltersController < ApplicationController
  respond_to :json, :html


  def index
    @shelters = Shelter.all
    
    respond_with @shelters
  end

  def show
    @shelter = Shelter.find(params[:id])
    @dogs = @shelter.dogs

    response = {:shelter => @shelter, :dogs => @dogs}

    respond_with response
  end
end
