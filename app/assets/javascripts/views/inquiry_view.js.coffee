((T) ->
  T.extend 'inquiry.View', Backbone.View.extend
    intialize: ->
      console.log('initing view')
)(window.testDouble)