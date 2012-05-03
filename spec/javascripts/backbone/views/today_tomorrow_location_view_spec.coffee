describe "Zambia.Views.TodayTomorrowLocationView", ->
  describe "and it is today", ->
    Given -> @model = new Backbone.Model isToday: true, city: 'Hilliard'
    Given -> @subject = new Zambia.Views.TodayTomorrowLocationView model: @model
    Then -> @subject.shouldBeDefined

    describe "event bindings", ->
      Then -> @subject.events["click .tweet-it"].shouldBeDefined
      Then -> expect(@subject.events["click .tweet-it"]).toBe "tweetIt"

    describe "#twitterLink", ->
      Given -> @twitterLink = @subject.twitterLink()
      Then -> expect(@twitterLink).toContain("twitter.com")
      Then -> expect(@twitterLink).toContain("this morning")
      Then -> expect(@twitterLink).toContain(@model.get("city"))

    describe "#twitterLinkText", ->
      Given -> @linkText = @subject.twitterLinkText()
      Then -> expect(@linkText).toContain("tweet your presence")

  describe "and it is tomorrow", ->
    Given -> @model = new Backbone.Model isTomorrow: true, city: 'Hilliard'
    Given -> @subject = new Zambia.Views.TodayTomorrowLocationView model: @model
    Then -> @subject.shouldBeDefined

    describe "#twitterLink", ->
      Given -> @twitterLink = @subject.twitterLink()
      Then -> expect(@twitterLink).toContain("twitter.com")
      Then -> expect(@twitterLink).toContain("will be at")
      Then -> expect(@twitterLink).toContain(@model.get("city"))

    describe "#twitterLinkText", ->
      Given -> @linkText = @subject.twitterLinkText()
      Then -> expect(@linkText).toContain("tweet your intentions")
