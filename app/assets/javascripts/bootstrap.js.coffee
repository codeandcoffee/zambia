unless window.jasmineSpecsAreRunning
  $.ajaxSetup
    beforeSend: (xhr) ->
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));

  $ ->
    window.router = new Zambia.Routers.SiteRouter();
    Backbone.history.start();
