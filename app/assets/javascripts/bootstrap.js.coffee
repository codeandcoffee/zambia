(->
  T = window.testDouble = window.testDouble || {}
  extend.myNamespace(testDouble)
  extend.noConflict()

  # $ ->
  #   v = new T.inquiry.View(model: new T.inquiry.Model()).render()
  #   $('body').append(v.el)
)()