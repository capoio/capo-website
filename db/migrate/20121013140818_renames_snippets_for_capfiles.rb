class RenamesSnippetsForCapfiles < ActiveRecord::Migration
  def change
    rename_column :capfiles, :snippets, :recipes
  end

  def down
  end
end
