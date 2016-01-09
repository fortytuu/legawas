class Application.Components.SpellingTask.Views.SpellingTaskView extends Application.View
	tagName: 'tr'
	className: 'js--spelling-task form-group' 

	initialize: (attributes) =>
		@attributes = attributes
		if @attributes?.state is 'is-new'
			@template = _.template("
				<td><input type='text' placeholder='Lösung' class='js--solution-text form-control input-md'></input></td>
				<td><input type='text' placeholder='Lückentext' class='js--fill-in-text form-control input-md'></input></td>
				<td><button class='js--add btn btn-primary' data-id='<%= id %>'>Hinzufügen</button></td>
			")
		else
			@template = _.template("
				<td><%= solution_text %></td>
				<td><%=fill_in_text %></td>
				<td><button class='js--destroy btn btn-danger' data-id='<%= id %>'>Löschen</button></td>
			")

	getRenderData: =>
		@attributes	

	afterRender: =>
		@$('.js--add').on 'click', @add
		@$('.js--destroy').on 'click', @destroy

	add: (event) =>
		event.preventDefault()

		id = $(event.currentTarget).data('id')
		solutionText = @$('.js--solution-text').val()
		fillInText = @$('.js--fill-in-text').val()
		$.ajax(
			url:"/api/spelling_tasks"
			type: 'POST'
			dataType: 'json'
			data: 
				spelling_task:
					solution_text: solutionText
					fill_in_text: fillInText
					category_id: id
		).done (response) =>
			@$('.js--error').remove()	
			@$('.has-error').removeClass('has-error')
			errorElement = "<div class='help-block js--error'><em>Bitte ausfüllen</em></div>"
			if response.errors
				if response.errors.fill_in_text
					@$('.js--fill-in-text').parent().addClass('has-error').append(errorElement)

				if response.errors.solution_text
					@$('.js--solution-text').parent().addClass('has-error').append(errorElement)
			else
				@trigger 'add:spellingTask'

	destroy: (event) =>
		event.preventDefault()
		
		id = $(event.currentTarget).data('id')
		$.ajax(
			url: "/api/spelling_tasks/#{id}"
			type: 'DELETE'
			dataType: 'json'
		).done (response) => 
			@remove()
