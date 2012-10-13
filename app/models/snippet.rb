class Snippet < ActiveRecord::Base
  attr_accessible :code, :dependencies, :description, :name, :variables, :version, :tag_list

  serialize :variables, Hash
  serialize :dependencies, Hash

  belongs_to :category

  acts_as_taggable
end
