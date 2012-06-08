class Zambia.Views.LocationView extends Backbone.View
  template: JST["backbone/templates/location"]

  events:
    'click .checkin': 'checkIn'

  render: =>
    $(@el).html @template {
      city: @model.get "city"
      coffeeshop: @model.get "coffeeshop"
      dayAndTime: @model.dayAndTime()
    }
    @
  
  checkIn: ->
    location = @model.get "city"
    console.log "I'm at " + location
