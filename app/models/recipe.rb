class Recipe < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :code, :dependencies, :description, :name, :variables, :version, :tag_list, :category_id

  serialize :variables, Hash
  serialize :dependencies, Hash

  belongs_to :category

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :version
  validates_format_of :name, with: /^\w+$/
end
