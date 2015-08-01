class VisitorsController < ApplicationController


  def index
    @shelters = Shelter.all.sort{|a,b| a.name <=> b.name}
  end
end
