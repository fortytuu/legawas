class SpellingTask < ActiveRecord::Base
	belongs_to :category

	validates :solution_text, :fill_in_text, :category_id, presence: true
	validates :solution_text, uniqueness: { scope: :category_id, message: 'Dieses Wort gibt es in der Kategorie bereits.' }
end