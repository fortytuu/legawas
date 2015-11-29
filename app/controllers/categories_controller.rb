class CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
		session[:task_ids] = nil
		session[:current_task_index] = nil
	end
end