class Zambia.Views.LocationView extends Backbone.View
  tagName: 'div'

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
      buttonTitle: @twitterTitle()
      buttonEnabledClass: @twitterButtonEnabled()
      buttonTwitterLink: if @isTodayOrTomorrow() then @twitterLink() else "#"
    }
    @

  twitterLink: ->
    link = "#"
    baseLink = "http://twitter.com/intent/tweet?hashtags=codeandcoffee&url=http%3A%2F%2Fcodeandcoffee.info"
    if @model.get "isToday"
      text = "&text=Livin' it up at the " + @model.get("city") + " code and coffee this morning."
      link = baseLink + text

    if @model.get "isTomorrow"
      text = "&text=I will be at " + @model.get("city") + " code and coffee tomorrow! Wanna join me?"
      link = baseLink + text

    return link

  twitterTitle: ->
    title = "You have to wait..."

    if @model.get "isToday"
      title = "I'm here!"

    if @model.get "isTomorrow"
      title = "I'll be there!"

    return title
    
  twitterButtonEnabled: ->
    buttonClass = "disabled"

    if @isTodayOrTomorrow()
      buttonClass = ""

    return buttonClass

  isTodayOrTomorrow: ->
    return @model.get("isToday") or @model.get("isTomorrow")

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
    location = @model.get "city"
    console.log "I'm at " + location
