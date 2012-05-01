class Zambia.Views.TodayTomorrowLocationView extends Backbone.View
  template: JST["backbone/templates/today_tomorrow_location"]

  events:
    'click .tweet-it': 'tweetIt'

  render: =>
    $(@el).html @template {
      city: @model.get "city"
      coffeeshop: @model.get "coffeeshop"
      time: @model.get "time"
      twitterLink: @twitterLink()
      linkText: @twitterLinkText()
    }
    @

  twitterLink: ->
    link = "http://twitter.com/intent/tweet?hashtags=codeandcoffee&url=http%3A%2F%2Fcodeandcoffee.info"
    if @model.get "isToday"
      text = "&text=Livin' it up at the " + @model.get("city") + " code and coffee this morning."

    if @model.get "isTomorrow"
      text = "&text=I will be at " + @model.get("city") + " code and coffee tomorrow! Wanna join me?"

    return link + text

  twitterLinkText: ->
    text = "tweet your presence with authority"
    if @model.get "isTomorrow"
      text = "tweet your intentions"

    return text

  tweetIt: ->
    console.log 'tweeting...'

