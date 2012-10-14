class AddSettingsCodeToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :settings_code, :text
  end
end
