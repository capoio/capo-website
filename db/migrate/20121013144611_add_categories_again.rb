class AddCategoriesAgain < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_column :recipes, :category_id, :integer
  end
end
