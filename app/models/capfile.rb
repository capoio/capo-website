require 'digest/md5'

class Capfile < ActiveRecord::Base

  attr_accessible :content, :identifier, :recipes

  serialize :recipes, Array

  def to_param
    identifier
  end

  def all_recipes
    recipes.inject([]) {|all, rec| all << Recipe.where(id: rec.keys.first).where(version: rec.values.first).first}
  end
end
