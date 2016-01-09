class SpellingTask < ActiveRecord::Base
	belongs_to :category

	validates :solution_text, :fill_in_text, :category_id, presence: true
end