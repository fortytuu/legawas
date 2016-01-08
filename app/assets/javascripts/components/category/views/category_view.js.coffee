class Application.Components.Category.Views.CategoryView extends Backbone.View
	events: 
		'change .js--select': 'select'

	select: (event) =>
		$target = $(event.currentTarget)
		categoryId = $target.val()
		@$('.js--spelling-tasks').html('')

		return unless categoryId
		
		$.ajax(
			url: "/api/category_spelling_tasks/#{categoryId}",
			type: 'GET',
			dataType: 'json'
		).done (response) =>
			_.each response.spelling_tasks, (spelling_task) =>
				view = new Application.Components.SpellingTask.Views.SpellingTaskView(spelling_task)
				@$('.js--spelling-tasks').append(view.render().el)
			