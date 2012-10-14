class Recipe < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :code, :dependencies, :description, :name, :variables, :version, :tag_list, :category_id, :settings_code

  serialize :variables, Array
  serialize :dependencies, Array

  belongs_to :category

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :version
  validates_format_of :name, with: /^\w+$/

  def self.sync_repo_to_db(recipes_array)
    recipes_array.each do |recipe|
      s = Recipe.find_or_initialize_by_name_and_version(recipe[:name],recipe[:version])
      s.description = recipe[:description]
      s.dependencies = recipe[:dependencies]
      s.code = recipe[:code_block]
      s.settings_code = recipe[:settings_block]
      s.save!
    end
  end

end
