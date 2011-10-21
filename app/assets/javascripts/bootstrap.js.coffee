(->
  T = window.testDouble = window.testDouble || {}
  extend.myNamespace(testDouble)
  extend.noConflict()

  $ ->
    new T.inquiry.View(model: new T.inquiry.Model()).render()
)()