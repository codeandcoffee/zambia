unless window.jasmineSpecsAreRunning
  $ ->
    window.router = new TestDouble.Routers.SiteRouter();
    Backbone.history.start();
