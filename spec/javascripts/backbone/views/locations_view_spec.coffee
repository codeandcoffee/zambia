describe "Zambia.Views.Locations", ->
  Given -> @subject = new Zambia.Views.Locations
  Then -> expect(@subject.template).toEqual("backbone/templates/locations")
  # Given -> @collection = new Backbone.Collection
  # Given -> @subject = new Zambia.Views.LocationsView collection: @collection
  # Then -> @subject.shouldBeDefined
  # Then -> @subject.tagName == 'div'
