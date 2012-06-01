require 'chronic'

class LocationsController < ApplicationController
  respond_to :json

  def index
    locations = Location.new.set_up_today_and_tomorrow
    render :json => locations.sort_by{|l| Chronic.parse(l['day']).wday}.rotate(Time.now.wday).to_json
  end
end
