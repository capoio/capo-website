class CreateCapfiles < ActiveRecord::Migration
  def change
    create_table :capfiles do |t|
      t.string :identifier
      t.text :content
      t.text :snippets

      t.timestamps
    end
  end
end
