class RemoveCategories < ActiveRecord::Migration
  def up
    remove_column :snippets, :category_id
    drop_table :categories
  end
end
