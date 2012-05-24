class Zambia.Views.LocationView extends Backbone.View
  template: JST["backbone/templates/location"]

  events:
    'click .checkin': 'checkIn'
    'click .map': 'mapPopover'

  render: =>
    $(@el).html @template {
      city: @model.get "city"
      coffeeshop: @model.get "coffeeshop"
      day: @model.get "day"
      time: @model.get "time"
    }
    @
  
  checkIn: ->
    location = @model.get "city"
    console.log "I'm at " + location
