#= require_self
#
#= require_tree ./views

Application.Components.Task = {
  Views: {}
}

$ ->
	$('.js--task').each (index, element) -> 
		new Application.Components.Task.TaskView(el: element)
