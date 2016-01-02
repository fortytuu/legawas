#= require_self
#
#= require_tree ./views

Application.Components.Role = {
  Views: {}
}

$ ->
	$('.js--user-role').each (index, element) -> 
		new Application.Components.Role.UserRolesView(el: element)