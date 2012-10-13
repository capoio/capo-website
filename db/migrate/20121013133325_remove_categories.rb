class RemoveCategories < ActiveRecord::Migration
  def up
    remove_column :recipes, :category_id
    drop_table :categories
  end
end
