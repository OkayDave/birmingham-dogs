class SheltersController < ApplicationController
  respond_to :json, :html


  def index
    @shelters = Shelter.all
    
    respond_with @shelters do |format|
      format.html
      format.json { render json: { shelters: @shelters }}
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
    @dogs = @shelter.dogs

    respond_with @shelter do |format|
      format.html
      format.json { render json: { shelter: @shelter } }
    end
  end
end
