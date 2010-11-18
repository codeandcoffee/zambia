class LocationsController < ApplicationController
  
  #GET /locations
  def index
    @locations = Location.all.asc(:name)
  end
  
  #GET /locations/new
  def new
    @location = Location.new
  end
  
  #POST /locations/create
  def create
    @location = Location.new(params[:location])
    
    if (@location.save)
      redirect_to :action => "index"
    else
      render "new"
    end
  end
  
end
