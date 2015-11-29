class ExercisesController < ApplicationController
	def index
		@category ||= Category.find(params[:category_id]) 
		@task_ids = session[:task_ids]
		@task_ids ||= @category.spelling_tasks.map(&:id).shuffle.take(5)
		session[:task_ids] ||= @task_ids
		session[:current_task_index] ||= -1
		if session[:current_task_index].present? && session[:current_task_index] < @task_ids.length - 1
			session[:current_task_index] += 1
			@spelling_task = SpellingTask.find(@task_ids[session[:current_task_index]])
		else
			session[:current_task_index] = nil
		end
	end
end