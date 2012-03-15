class Zambia.Models.Inquiry extends Backbone.Model
  url: -> "/inquiries/#{@escape('id')}"
  toJSON: -> {'inquiry': super}
