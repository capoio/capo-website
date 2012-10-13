class Snippet < ActiveRecord::Base
  attr_accessible :code, :dependencies, :description, :name, :variables, :version, :tag_list

  serialize :variables, Array
  serialize :dependencies, Array

  acts_as_taggable
end
