class Snippet < ActiveRecord::Base
  attr_accessible :code, :dependencies, :description, :name, :variables, :version, :tag_list

  serialize :variables, Hash
  serialize :dependencies, Hash

  acts_as_taggable
end
