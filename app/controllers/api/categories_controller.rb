module Api
	class CategoriesController < ApiController
		load_and_authorize_resource only: [:create, :destroy]

		def create
			@category = Category.create(category_params)
		end

		def destroy
			@category.destroy
		end

		private

		def category_params
			params.require(:category).permit(:topic_id, :short_title, :title, :description, :url, response_options: [])
		end
	end
end