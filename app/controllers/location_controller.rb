class LocationController < ApplicationController
  def new
    @location = Location.new
  end
end
