#= require_self
#
#= require_tree ./views

Application.Components.Topic = {
  Views: {}
}

$ ->
	$('.js--topic').each (index, element) ->
    new Application.Components.Topic.Views.TopicsView(el: element)
