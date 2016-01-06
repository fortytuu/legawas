class Application.Components.SpellingTask.Views.SpellingTaskView extends Application.View
	tagName: 'tr'

	initialize: (attributes) =>
		@attributes = attributes
		@template = _.template("
				<td><%= solution_text %></td>
				<td><%=fill_in_text %></td>
				<td><button class='js--remove' data-id='<%= id %>'>Löschen</button></td>
			")

	getRenderData: =>
		@attributes	

	afterRender: =>
		@$('.js--remove').on 'click', @remove

	remove: (event) =>
		event.preventDefault()
		event.stopPropagation()
		id = $(event.currentTarget).data('id')
		console.log id
	