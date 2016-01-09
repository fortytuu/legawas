class Application.Components.Category.Views.CategoryView extends Application.View
	tagName: 'tr'

	events: 
		'change .js--select': 'select'

	spellingTasksSelector: '.js--spelling-tasks'
	
	initialize: (attributes) =>
		@attributes = attributes
		if @attributes?.state is 'is-new'
			@template = _.template("
				<td><input type='text' placeholder='Kurztitel' class='js--short-title form-control input-md'></input></td>
				<td><input type='text' placeholder='Titel ausführlich' class='js--title form-control input-md'></input></td>
				<td><input type='text' placeholder='Antwortmöglichkeiten (durch Komma getrennt)' class='js--response-options form-control input-md'></input></td>
				<td><input type='text' placeholder='Beschreibung' class='js--description form-control input-md'></input></td>
				<td><button class='js--add btn btn-primary' data-id='<%= id %>'>Hinzufügen</button></td>
			")
		else
			@template = _.template("
				<td><%= short_title %></td>
				<td><%= title %></td>
				<td><%= response_options %></td>
				<td><%= description %></td>
				<td><button class='js--destroy btn btn-danger' data-id='<%= id %>'>Löschen</button></td>
			")

	getRenderData: =>
		@attributes	

	afterRender: =>
		@$('.js--add').on 'click', @add
		@$('.js--destroy').on 'click', @destroy

	add: (event) =>
		event.preventDefault()

		topicId = $(event.currentTarget).data('id')
		shortTitle = @$('.js--short-title').val()
		title = @$('.js--title').val()
		description = @$('.js--description').val()
		responseOptions = @$('.js--response-options').val()
		
		$.ajax(
			url:"/api/categories"
			type: 'POST'
			dataType: 'json'
			data: 
				category:
					topic_id: topicId
					short_title: shortTitle
					title: title
					description: description
					response_options: if responseOptions then responseOptions.split(',') else []
		).done (response) =>
			@$('.js--error').remove()	
			@$('.has-error').removeClass('has-error')
			errorElement = "<div class='help-block js--error'><em>Bitte ausfüllen</em></div>"
			if response.errors
				@$('.js--short-title').parent().addClass('has-error').append(errorElement) if response.errors.short_title
				@$('.js--title').parent().addClass('has-error').append(errorElement) if response.errors.title
				@$('.js--response-options').parent().addClass('has-error').append(errorElement) if response.errors.response_options
			else
				@trigger 'add:category'
	
	select: (event) =>
		$target = $(event.currentTarget)
		categoryId = $target.val()
		@$(@spellingTasksSelector).html('')

		return unless categoryId
		
		view = new Application.Components.SpellingTask.Views.SpellingTaskView({id: categoryId, state: 'is-new'})
		@$(@spellingTasksSelector).append(view.render().el)
		@listenTo view, 'add:spellingTask', => @select(event)

		$.ajax(
			url: "/api/category_spelling_tasks/#{categoryId}"
			type: 'GET'
			dataType: 'json'
		).done (response) =>
			_.each response.spelling_tasks, (spelling_task) =>
				view = new Application.Components.SpellingTask.Views.SpellingTaskView(spelling_task)
				@$(@spellingTasksSelector).append(view.render().el)
	
	destroy: (event) =>
		event.preventDefault()
		
		id = $(event.currentTarget).data('id')
		$.ajax(
			url: "/api/categories/#{id}"
			type: 'DELETE'
			dataType: 'json'
		).done (response) => 
			@remove()