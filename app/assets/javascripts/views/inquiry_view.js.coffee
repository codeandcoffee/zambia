((T) ->
  T.extend 'inquiry.View', Backbone.View.extend
    initialize: ->
      @template = JST['templates/inquiry']()
    render: ->
      $(@el).html(@template)
      @

)(window.testDouble)