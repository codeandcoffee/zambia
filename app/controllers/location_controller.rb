class LocationController < ApplicationController
  
  #GET /location
  def index
    @locations = Location.all.asc(:name)
  end
  
  #GET /location/new
  def new
    @location = Location.new
  end
  
  #POST /location/create
  def create
    @location = Location.new(params[:location])
    
    if (@location.save)
      redirect_to :action => "index"
    else
      render "new"
    end
  end
  
end
