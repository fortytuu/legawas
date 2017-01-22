class HomepageController < ApplicationController
  load_resource :topic, parent: false

  def index
  end
end
