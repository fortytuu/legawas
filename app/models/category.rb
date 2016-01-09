class Category < ActiveRecord::Base
	serialize :response_options, Array
	
	belongs_to :topic
	has_many :spelling_tasks

	validates :title, :short_title, :response_options, presence: true
end