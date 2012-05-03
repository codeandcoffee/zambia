describe "Zambia.Views.TodayLocationsView", ->
  Given -> @collection = new Backbone.Collection
  Given -> @subject = new Zambia.Views.TodayLocationsView collection: @collection
  Then -> @subject.shouldBeDefined
  Then -> @subject.tagName == 'div'
