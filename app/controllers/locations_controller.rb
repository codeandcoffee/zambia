class LocationsController < ApplicationController
  
  #GET /locations
  def index
    @locations = Location.all.asc(:name)
  end
  
  #GET /locations/new
  def new
    @location = Location.new
  end
  
  #POST /locations
  def create
    @location = Location.new(params[:location])

    #if(@location.valid? == false)
    #  render "view"
    #end
    
    if (@location.save)
      @locations = Location.all.asc(:name)
      render :action => "index"
    else
      render "new"
    end
  end
end
