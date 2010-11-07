class LocationsController < ApplicationController
  
  #GET /locations/new
  def new
    @location = Location.new
  end
  
  #POST /locations
  def create
    @location = Location.new(params[:location])
  end
end
