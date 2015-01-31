{Emitter} = require 'emissary'
{CompositeDisposable, $, View} = require 'atom'
path = require 'path'

###
* Form Properties Widget
###

window.Apex ?= {}
Apex.Form ?= {}

module.exports =
class Apex.Form.PropertiesView extends View
  Emitter.includeInto @

  @content: ->
    @div class: 'tool-window', =>
      @tag 'atom-panel', class: 'toolbox-panel', =>
        @div class: 'inset-panel', =>
          @div class: 'panel-heading', =>
            @span 'Bindings / Delegates'
          @div class: 'panel-body padded', outlet: 'delegates'
      @tag 'atom-panel', class: 'toolbox-panel', =>
        @div class: 'inset-panel', =>
          @div class: 'panel-heading', =>
            @span 'Properties'
          @div class: 'panel-body padded', outlet: 'properties'

  initialize: (params) ->
    if params.parent
      @parent = params.parent
    @makeVisible = @show
    @show = @showProperties

  showProperties: (obj) ->
    console.dir(obj)
    @makeVisible() # jq show

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    if @element then @element.remove()

  getElement: ->
    @element
  setViewHost: (@viewHost) ->
  getViewClass: -> Apex.Form.PropertiesView
  getView:      -> @
