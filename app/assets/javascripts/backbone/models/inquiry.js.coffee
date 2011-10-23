class TestDouble.Models.Inquiry extends Backbone.Model
  paramRoot: 'inquiry'
  
class TestDouble.Collections.InquiriesCollection extends Backbone.Collection
  model: TestDouble.Models.Inquiry
  url: '/inquiries'