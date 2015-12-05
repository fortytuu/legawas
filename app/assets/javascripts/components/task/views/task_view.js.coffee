class Application.Components.Task.TaskView extends Backbone.View
	events: 
		'click .js--click': 'check'

	initialize: -> 
		console.log 'Hallo'

	check: (event) => 
		console.log event