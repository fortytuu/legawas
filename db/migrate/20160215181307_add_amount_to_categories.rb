class AddAmountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :amount, :integer
  end
end
