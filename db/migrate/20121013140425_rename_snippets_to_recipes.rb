class RenameSnippetsToRecipes < ActiveRecord::Migration
  def change
    rename_table :snippets, :recipes
  end
end
