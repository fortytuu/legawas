class CreateSpellingTasks < ActiveRecord::Migration
  def change
    create_table :spelling_tasks do |t|
      t.integer :category_id
      t.text :solution_text
      t.text :fill_in_text
      
      t.timestamps
    end
  end
end
