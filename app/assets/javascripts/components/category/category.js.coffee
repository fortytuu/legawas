#= require_self
#
#= require_tree ./views

Application.Components.Category = {
  Views: {}
}

$ ->
	$('.js--categories').each (index, element) -> 
		new Application.Components.Category.CategoryView(el: element)
 
 	$('.js--reset-session-storage').click -> 
 		window.sessionStorage.setItem('success-score', 0)
 		window.sessionStorage.setItem('failure-score', 0)