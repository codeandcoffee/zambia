unless window.jasmineSpecsAreRunning
  $.ajaxSetup
    beforeSend: (xhr) ->
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));

  $ ->
    window.router = new TestDouble.Routers.SiteRouter();
    Backbone.history.start();
