class Zambia.Models.Location extends Backbone.Model

class Zambia.Collections.Locations extends Backbone.Collection
  model: Zambia.Models.Location
  url: "/locations"
