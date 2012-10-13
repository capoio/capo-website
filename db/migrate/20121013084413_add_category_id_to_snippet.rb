class AddCategoryIdToSnippet < ActiveRecord::Migration
  def change
   add_column :snippets, :category_id, :integer
  end
end
