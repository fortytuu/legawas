class CategoriesController < ApplicationController
  load_and_authorize_resource :topic
  load_and_authorize_resource

  before_action :serialize_response_options, only: [:update]

  def edit; end

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = "Änderungen wurden übernommen."
    else
      flash[:alert] = "Fehler. Bitte Eingaben überprüfen."
    end
    render :edit, flash: flash
  end

  def show
    session[:task_ids] = nil
    session[:current_task_index] = nil
  end

  private

  def category_params
    params
      .require(:category)
      .permit(:title, :short_title, :description, :amount, response_options: [])
      .merge(response_options: serialize_response_options)
  end

  def serialize_response_options
    Hash[*params[:category][:response_options]].map do |key, value|
      next if key.empty?
      {"name" => key, "value" => value}
    end.compact
  end
end
