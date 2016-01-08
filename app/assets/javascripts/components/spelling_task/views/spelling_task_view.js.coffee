class Application.Components.SpellingTask.Views.SpellingTaskView extends Application.View
	tagName: 'tr'

	initialize: (attributes) =>
		@attributes = attributes
		@template = _.template("
				<td><%= solution_text %></td>
				<td><%=fill_in_text %></td>
				<td><button class='js--destroy' data-id='<%= id %>'>Löschen</button></td>
			")

	getRenderData: =>
		@attributes	

	afterRender: =>
		@$('.js--destroy').on 'click', @destroy

	destroy: (event) =>
		event.preventDefault()
		event.stopPropagation()
		id = $(event.currentTarget).data('id')
		$.ajax(
			url: "/api/spelling_tasks/#{id}"
			type: 'DELETE'
			dataType: 'json'
		).done (response) => 
			@remove()

	