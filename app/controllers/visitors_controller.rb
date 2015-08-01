class VisitorsController < ApplicationController


  def index
    @shelters = Shelter.all
  end
end
