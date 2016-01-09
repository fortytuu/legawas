module Api
	class CategorySpellingTasksController < ApiController
		load_and_authorize_resource :category, parent: false
		# load_and_authorize_resource :spelling_task, through: [:category]

		def show
			@spelling_tasks = @category.spelling_tasks.order('lower(solution_text)')
		end
	end
end