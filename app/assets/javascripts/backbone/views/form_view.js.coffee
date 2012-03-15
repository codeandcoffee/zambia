class Zambia.Views.FormView extends Backbone.View
  events: ->
    'change :input': 'propogateChangesToModel'

  render: ->
    @syncForm(@$('form'),@model)

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @model.save
      success: (createdResource) =>
        @model = createdResource

      error: (model, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText) })


  syncForm: ($form,model)->
    self = @
    $form.find(':input[name]').each (i,el) ->
      $el = $(el);
      name = $el.attr('name')
      model.bind 'change:'+name, -> $el.val(model.get(name))
      if model.get(name)
        $el.val(model.get(name))
      else
        self.propogateChangesToModel target: el

  propogateChangesToModel: (e) ->
    $el = $(e.target)
    attrs = {}
    attrs[$el.attr('name')] = $el.val()
    @model.set attrs

  printForm: ($root) =>
    s = ""
    _($root.contents()).each (el) ->
      return if @hidden(el)
      $el = $(el)

      s += '\n\n' if $el.is('div')
      if @textNode(el)
        text = _($(el).text()).clean()
        s += @padIfAlphabetic(text) + text + ' '
      else if $el.is(':input')
        s += $el.val() || "__[#{$el.attr('name')}]__" unless $el.is('.btn')
      else
        s += @printForm $el
    ,@
    s

  #private

  hidden: (el) ->
    if @textNode(el)
      $(el).parent().is(':hidden')
    else
      $(el).is(':hidden')

  textNode: (el) ->
    el.nodeType == 3

  padIfAlphabetic: (content) =>
    if content.match(/^[A-z]/) then ' ' else ''
