class LocationsController < ApplicationController
  respond_to :json

  def index
    locations = [
      {:name => "Starbux", :meet => "Friday"},
      {:name => "Caribou", :meet => "Tuesday"}
    ]
    
    render :json => locations.to_json
  end
end
