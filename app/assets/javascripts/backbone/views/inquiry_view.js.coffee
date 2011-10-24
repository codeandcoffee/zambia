TestDouble.Views.Inquiries ||= {}

class TestDouble.Views.InquiryView extends Backbone.View
  template: JST["backbone/templates/inquiry"]

  categories: [
    "build an application",
    "receive training",
    "talk about something else"
  ]

  events:
    "click .send": "save"
    "submit *": "save"
    'change :input[name="category"]': "showSelectedCategory"
    'change :input': 'propogateChangesToModel'

  initialize: ->
    @model.bind "change:errors", () => @render()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set fullInquiryText: @printForm(@$('form'))
    @model.unset("errors")

    @collection.create @model.toJSON(),
      success: (inquiry) =>
        @model = inquiry

      error: (inquiry, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText) })

  render: ->
    $(@el).html(@template({model: @model, view: @}))
    @syncForm(@$('form'),@model)
    @showSelectedCategory()
    @

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


  showSelectedCategory: ->
    selectedClass = @$(':input[name="category"] :selected').attr('class')
    window.location.hash = 'inquiry/' + selectedClass
    @$('.category').each (i,el) -> $(el).toggleClass('hidden',!$(el).hasClass(selectedClass))

  #private

  printForm: ($root) =>
    s = ""
    _($root.contents()).each (el) ->
      $el = $(el)
      s += '\n\n' if $el.is('div')
      if @textNode(el)
        text = _(el.textContent).clean()
        s += @padIfAlphabetic(text) + text + ' '
      else if $el.is(':input')
        s += $el.val() || "__[#{$el.attr('name')}]__" unless $el.is('button')
      else
        s += @printForm $el
    ,@
    s

  textNode: (el) ->
    el.nodeType == 3

  padIfAlphabetic: (content) =>
    if content.match(/^[A-z]/) then ' ' else ''


