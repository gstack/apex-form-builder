{Emitter} = require 'emissary'
{CompositeDisposable} = require 'atom'
$ = require 'jquery'
{View} = require 'atom-space-pen-views'
path = require 'path'

window.Apex ?= {}
Apex.Form ?= {}

###
    Text Editor (Core)
    -------------------

    Atom's integrated text/syntax editing widget
###

module.exports =
class Apex.Form.TextEditor extends Apex.Form.Widget

  widgetType: 'editor'

  # perform initialization logic, subclasses should override
  initialize: (params) ->
    super params
    @title = 'string:editor'
    console.log 'editor initialized'

  # constructs a version of the view for designer use (with tools, built-in focus logic)
  designer: ->
    @editor = $('<atom-text-editor />')
    @editor.text @title
    @editor.addClass 'grow'
    @editor.css 'overflow', 'scroll'
    @append @editor

  # construct the regular view element onto @body
  view: ->
    @editor = $('<atom-text-editor />')
    @editor.text @title
    @editor.addClass 'grow'
    @editor.css 'overflow', 'overlay'
    #@editor.click => @emit 'click'
    #@editor.dblclick => @emit 'dblclick'
    @append @editor

Apex.widgetResolver.add 'editor', Apex.Form.TextEditor
console.log('resolver added editor')
