require 'digest/md5'

class Capfile < ActiveRecord::Base

  attr_accessible :content, :identifier, :recipes

  serialize :recipes, Array

  after_create :fetch_content

  def to_param
    identifier
  end

  def all_recipes
    recipes.inject([]) {|all, rec| all << Recipe.where(id: rec.keys.first).where(version: rec.values.first).first}
  end

  private
  def fetch_content
    foo = ''
    recipes.each do |recipe_hash|
      foo << Recipe.where(id: recipe_hash.keys.first).where(version: recipe_hash.values.first).first.code
    end
    update_attribute :content, foo
  end
end
