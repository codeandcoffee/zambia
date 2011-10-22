TestDouble.Views.Inquiries ||= {}

class TestDouble.Views.Inquiries.NewView extends Backbone.View
  template: JST["backbone/templates/inquiries/new"]

  events:
    "submit #new-inquiry": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (inquiry) =>
        @model = inquiry
        window.location.hash = "/#{@model.id}"

      error: (inquiry, jqXHR) =>
        @model.set({errors: jqXHR.responseText})
    )

  render: ->
    $(this.el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this