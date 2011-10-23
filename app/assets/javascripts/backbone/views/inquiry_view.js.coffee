TestDouble.Views.Inquiries ||= {}

class TestDouble.Views.InquiryView extends Backbone.View
  template: JST["backbone/templates/inquiry"]

  events:
    "click .send": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind "change:errors", () => this.render()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create @model.toJSON(),
      success: (inquiry) =>
        @model = inquiry
        window.location.hash = "/#{@model.id}"

      error: (inquiry, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText) })

  render: ->
    $(this.el).html(@template(@model.toJSON()))
    this.$("form").backboneLink(@model)
    @