module Api
	class SpellingTasksController < ApiController
		load_and_authorize_resource

		def destroy
			@spelling_task.delete
		end
	end
end