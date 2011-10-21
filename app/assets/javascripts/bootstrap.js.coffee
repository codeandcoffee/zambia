(->
  T = window.testDouble = window.testDouble || {}
  extend.myNamespace(testDouble)
  extend.noConflict()

  $ ->
    T.inquiry.View(model: T.inquiry.Model()).render()
)()