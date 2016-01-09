module Api
	class SpellingTasksController < ApiController
		load_and_authorize_resource only: [:destroy]

		def create
			@spelling_task = SpellingTask.create(spelling_task_params)
		end

		def destroy
			@spelling_task.delete
		end

		private

		def spelling_task_params
			params.require(:spelling_task).permit(:solution_text, :fill_in_text, :category_id)
		end
	end
end