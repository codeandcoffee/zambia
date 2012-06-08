require 'chronic'

class LocationsController < ApplicationController
  respond_to :json

  def index
    locations = Location.new
    locations.set_up_today_and_tomorrow
    render :json => locations.sort.rotate(Time.now.wday).to_json
  end
end
