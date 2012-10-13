require 'digest/md5'

class Capfile < ActiveRecord::Base

  attr_accessible :content, :identifier, :recipes

  serialize :recipes, Array

  after_create :fetch_content

  private
  def fetch_content
    foo = ''
    recipes.each do |recipe_hash|
      foo << Recipe.where(id: recipe_hash.keys.first).where(version: recipe_hash.values.first).first.code
      foo << '\n'
    end
    update_attribute :content, foo
  end
end
