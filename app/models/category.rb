class Category < ActiveRecord::Base
	serialize :response_options, Array
	
	belongs_to :topic
	has_many :spelling_tasks
end