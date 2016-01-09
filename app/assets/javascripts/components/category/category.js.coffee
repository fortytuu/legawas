#= require_self
#
#= require_tree ./views

Application.Components.Category = {
  Views: {}
}

$ ->
	view = null
	$('.js--categories').each (index, element) -> 
		new Application.Components.Category.Views.CategoryView(el: element)
 
 	$('.js--reset-session-storage').click -> 
 		window.sessionStorage.setItem('success-score', 0)
 		window.sessionStorage.setItem('failure-score', 0)