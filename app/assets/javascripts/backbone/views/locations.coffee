class Zambia.Views.Locations extends Backbone.Fixins.SuperView
  template: "backbone/templates/locations"

  renderLocations: =>
    @collection.each (location) =>
      @$el.append(new Zambia.Views.Location(model: location).render().el)
