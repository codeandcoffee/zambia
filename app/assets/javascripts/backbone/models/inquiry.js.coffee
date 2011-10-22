class TestDouble.Models.Inquiry extends Backbone.Model
  paramRoot: 'inquiry'

  defaults:
    name: null
    businessType: null
    category: null
    applicationType: null
    applicationBudget: null
    applicationContract: null
    trainingFormat: null
    trainingTopic: null
    trainingGroupSize: null
    discussionTopic: null
    phone: null
    email: null
    contactPreference: null
  
class TestDouble.Collections.InquiriesCollection extends Backbone.Collection
  model: TestDouble.Models.Inquiry
  url: '/inquiries'