class RenameSnippetVersion < ActiveRecord::Migration
  def change
    rename_column :snippets, :version, :code_version
  end
end
