(->
  T = window.testDouble = window.testDouble || {}
  extend.myNamespace(testDouble)
  extend.noConflict()

  $ ->
    $.getJSON '/inquiries', (inquiries) ->
      window.router = new TestDouble.Routers.InquiriesRouter({inquiries: inquiries});
      Backbone.history.start();
)()