module Api
  class TopicCategoriesController < ApiController
    load_and_authorize_resource :topic, parent: false

    def show
      @categories = @topic.categories.order('lower(short_title)')
    end
  end
end