class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :description
      t.text :code
      t.string :version
      t.text :variables
      t.text :dependencies

      t.timestamps
    end
  end
end
