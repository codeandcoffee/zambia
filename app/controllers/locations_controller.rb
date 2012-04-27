require 'chronic'

class LocationsController < ApplicationController
  respond_to :json

  def index
    now = LOCATIONS
    now.find{ |l| Chronic.parse(l[:day]).wday == Time.now.wday }.merge!(:isToday => true) 
    now.find{ |l| Chronic.parse(l[:day]).wday == Time.now.tomorrow.wday }.merge!(:isTomorrow => true) 
    
    render :json => now.sort_by{|l| Chronic.parse(l[:day]).wday}.to_json
  end
end
