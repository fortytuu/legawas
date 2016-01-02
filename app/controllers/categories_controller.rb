class CategoriesController < ApplicationController
	load_and_authorize_resource

	def show
		session[:task_ids] = nil
		session[:current_task_index] = nil
	end
end