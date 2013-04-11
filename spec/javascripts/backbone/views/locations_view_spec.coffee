describe "Zambia.Views.Locations", ->
  Given -> @collection = new Backbone.Collection [{name: "Columbus"}, {name: "Chicago"}]
  Given -> @subject = new Zambia.Views.Locations collection: @collection
  Then -> expect(@subject.template).toEqual("backbone/templates/locations")
