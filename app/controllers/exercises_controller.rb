class ExercisesController < ApplicationController

	def create
		@category = Category.find(params[:category_id]) 
		@task_ids = @category.spelling_tasks.map(&:id).shuffle.take(5)
		session[:task_ids] = @task_ids
		@spelling_task = SpellingTask.find(@task_ids[0])
		@next_task_index = 1
		render :show
	end

	def show
		@category = Category.find(params[:category_id])
		index = params[:id].to_i
		if index.present?
			@task_ids = session[:task_ids]
			@spelling_task = SpellingTask.find(@task_ids[index])
		end
		@next_task_index = index + 1
		if @next_task_index == @task_ids.length
			@next_task_index = nil
		end
	end
end