class LocationsController < ApplicationController
  respond_to :json

  def index
    render :json => LOCATIONS.to_json
  end
end
