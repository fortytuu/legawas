module Api
  class CategorySpellingTasksController < ApiController
    load_and_authorize_resource :category, parent: false

    def show
      @spelling_tasks = @category.spelling_tasks.order('lower(solution_text)')
    end
  end
end