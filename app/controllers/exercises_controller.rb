class ExercisesController < ApplicationController
  before_filter :category

  def create
    @task_ids = @category.spelling_tasks.map(&:id).shuffle.take(@category.amount)
    session[:task_ids] = @task_ids

    load_spelling_task
    
    render :show
  end

  def show
    @task_ids = session[:task_ids]
    load_spelling_task

    @progress = (100 * (@next_task_index - 1)) / @category.amount
    
    if @next_task_index == @task_ids.length
      @next_task_index = nil
    end

  end

  private

  def category
    @category = Category.find(params[:category_id]) 
  end

  def load_spelling_task
    index = params[:id].present? ? params[:id].to_i : 0
    @spelling_task = SpellingTask.find(@task_ids[index])
    @next_task_index = index + 1
  end
end