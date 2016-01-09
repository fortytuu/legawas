class Application.Components.Category.Views.CategoryView extends Backbone.View
	spellingTasksSelector: '.js--spelling-tasks'

	events: 
		'change .js--select': 'select'

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
			