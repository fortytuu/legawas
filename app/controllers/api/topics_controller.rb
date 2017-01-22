module Api
	class TopicsController < ApiController
		load_and_authorize_resource only: [:create, :index, :destroy]

		def create
			@topic = Topic.create(topic_params)
		end

		def index
		end

		def destroy
			@topic.destroy
		end

		private

		def topic_params
			params.require(:topic).permit(:title, :description)
		end
	end
end
