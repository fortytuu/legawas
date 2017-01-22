class SpellingTasksController < ApplicationController
  load_and_authorize_resource :topic, id_param: :topic_id
  
  def new
  end
end