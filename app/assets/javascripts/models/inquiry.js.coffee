((T) ->
  T.extend 'inquiry.Model', Backbone.Model.extend
    intialize: ->
      console.log('initing view')
)(window.testDouble)