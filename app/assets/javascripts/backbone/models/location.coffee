class Zambia.Models.Location extends Backbone.Model
  dayAndTime: ->
    day = @get('day')
    time = @get('time')
    return day + ' @ ' + time if day && time
    return day                if day
    "TBA"

class Zambia.Collections.Locations extends Backbone.Collection
  model: Zambia.Models.Location
  url: "/locations"

