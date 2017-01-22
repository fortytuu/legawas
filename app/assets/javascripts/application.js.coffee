#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require bootstrap-sprockets
#= require sweetalert.min
#
#= require_self
#
#= require components/topic/topic
#= require components/task/task
#= require components/category/category
#= require components/role/role
#= require components/spelling_task/spelling_task

class @Application

Application.Components ||= {}


class Application.View extends Backbone.View
  autoRender: false

  # save the options hash
  initialize: (@options = {}) ->
    super

    # check the element's data if this view is an inline view
    @inline = @$el.data('inline') is true

    unless @inline is true
      # check the view's option if it is an inline view
      @inline = @options.inline is true

    @render() if @autoRender is true

  # The template function for this view
  #
  # @param data [Object] data for this template
  # @return [String] a DOM-String
  template: (data) -> ''

  # A hash of partials that will be used when rendering the template
  partials: {}

  # A flag that prevents the rendering of DOM nodes
  # If a component has the inline flag, it has already been rendered
  # on the server
  inline: false

  # Is used to prepare the data for the template function.
  # By default it returns this.model.toJSON() if a model is set
  # @return [Object] data for the template
  getRenderData: ->
    if @model?
      @model.toJSON()
    else
      {}

  # Renders the template to the element and also renders all subviews
  # @return [View] this view
  render: =>
    unless @inline
      @$el.html @template @getRenderData()
    @afterRender()
    @

  # Is called after the view has been rendered
  afterRender: ->

  # Bind the remove method to the instance
  remove: => super
