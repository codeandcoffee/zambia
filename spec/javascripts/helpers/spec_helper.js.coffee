window.context = window.describe
window.xcontext = window.xdescribe

window.fakify = (owner,propertyName,newValue) ->
  memo = owner[propertyName]
  owner[propertyName] = newValue
  afterEach ->
    if(memo != undefined)
      owner[propertyName] = memo
    else
      delete owner[propertyName]

window.fakeBone = (parent,child,methodNames=[]) ->
  fake = jasmine.createSpyObj(child,_(methodNames).union(['constructor','initialize']))
  fakify(parent, child, Backbone.View.extend(fake))
  fake

beforeEach ->
  this.addMatchers
    toBeAnInstanceOf: (type) ->
      this.actual instanceof type