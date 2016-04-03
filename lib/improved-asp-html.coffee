ImprovedAspHtmlView = require './improved-asp-html-view'
{CompositeDisposable} = require 'atom'

module.exports = ImprovedAspHtml =
  improvedAspHtmlView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @improvedAspHtmlView = new ImprovedAspHtmlView(state.improvedAspHtmlViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @improvedAspHtmlView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'improved-asp-html:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @improvedAspHtmlView.destroy()

  serialize: ->
    improvedAspHtmlViewState: @improvedAspHtmlView.serialize()

  toggle: ->
    console.log 'ImprovedAspHtml was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
