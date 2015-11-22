class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.integer :topic_id
        t.string :short_title
    	t.string :title
    	t.text :response_options
    	t.text :description
    	t.string :url
    	t.timestamps
    end
  end
end
