class Category < ActiveRecord::Base
	serialize :response_options, Array
	
	belongs_to :topic
	has_many :spelling_tasks

	validates :title, :short_title, :response_options, :amount, presence: true
	validates :amount, inclusion: 1..100
	validates :title, :short_title, uniqueness: {message: 'Kategorie bereits vorhanden'}
end