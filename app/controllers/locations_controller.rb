require 'chronic'

class LocationsController < ApplicationController
  respond_to :json

  def index
    locations = set_up_today_and_tomorrow
    render :json => locations.sort_by{|l| Chronic.parse(l[:day]).wday}.rotate(Time.now.wday).to_json
  end

  private

  def set_up_today_and_tomorrow
    now = LOCATIONS

    now.each do |location|
      location[:isToday] = false if location[:isToday]
      location[:isTomorrow] = false if location[:isTomorrow]
    end

    now.find{ |l| Chronic.parse(l[:day]).wday == Time.now.wday }.merge!(:isToday => true) 
    now.find{ |l| Chronic.parse(l[:day]).wday == Time.now.tomorrow.wday }.merge!(:isTomorrow => true) 

    now
  end

end
