class Zambia.Models.Location extends Backbone.Model
  defaults:
    name: "Staufs"
    meet: "Thursdays"


class Zambia.Collections.Locations extends Backbone.Collection
  model: Zambia.Models.Location
  url: "/locations"
