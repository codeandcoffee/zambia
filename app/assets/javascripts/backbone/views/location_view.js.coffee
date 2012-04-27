class Zambia.Views.LocationView extends Backbone.View
  tagName: 'div'

  template: JST["backbone/templates/location"]

  events:
    'click .checkin': 'checkIn'
    'click .map': 'mapPopover'

  render: =>
    $(@el).html @template {model: @model}
    @

  mapPopover: (e) ->
    title = "Map of " + @model.get "coffeeshop"
    embed_map = @model.get "map"
    link_map = (@model.get "map").replace /;output=embed/, ""
    content = '<iframe width="252" height="180" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="' + embed_map + '"></iframe><br /><small><a href="' + link_map + '" style="color:#0000FF;text-align:left">View Larger Map</a></small>'
    @$(".map").popover({
      title: title,
      content: content,
      placement: 'left',
      trigger: 'manual'
      })
    @$(".map").popover("toggle")

    e.preventDefault()
  
  checkIn: ->
    city = @model.get 'city'
    url = 'http://twitter.com/intent/tweet?hashtags=codeandcoffee&url=http%3A%2F%2Fcodeandcoffee.info&text=Enjoying%20Code%20and%20Coffee%20in%20' + city
    window.open url, 'twitter', 'width=300, height=300'
    console.log "Red 5 checking in..."

    #twttr.events.bind('tweet', function(event) {
    #// Do something there
    #});
