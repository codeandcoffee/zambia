describe "Zambia.Views.LocationsView", ->
  Given -> @collection = new Backbone.Collection
  Given -> @subject = new Zambia.Views.LocationsView collection: @collection
  Then -> @subject.shouldBeDefined
  Then -> @subject.tagName == 'div'
