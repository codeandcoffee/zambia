TestDouble.Views.Inquiries ||= {}

class TestDouble.Views.InquiryView extends TestDouble.Views.FormView
  template: JST["backbone/templates/inquiry"]

  categories: [
    "build an application",
    "receive training",
    "talk with you"
  ]

  events: ->
    _.extend {}, super,
      "click .send": "save"
      "submit *": "save"
      'change :input[name="category"]': "showSelectedCategory"
      'change :input': 'propogateChangesToModel'
      'click .cancel': 'cancel'

  initialize: ->
    @model.bind "change:errors", () => @render()

  save: (e) ->
    @model.set fullInquiryText: @printForm(@$('form'))
    super e

  render: ->
    $(@el).html(@template({model: @model, view: @}))
    super
    @showSelectedCategory()
    @

  showSelectedCategory: ->
    selectedClass = @$(':input[name="category"] :selected').attr('class')
    window.router.navigate('inquiry/' + selectedClass)
    @$('.category').each (i,el) -> $(el).toggleClass('hidden',!$(el).hasClass(selectedClass))

  cancel: ->
    window.router.navigate '', true
