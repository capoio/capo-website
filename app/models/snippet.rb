class Snippet < ActiveRecord::Base
  acts_as_taggable
  has_paper_trail

  attr_accessible :code, :dependencies, :description, :name, :variables, :code_version, :tag_list, :category_id

  serialize :variables, Array
  serialize :dependencies, Array

  acts_as_taggable

  def sync_repo_to_db(snippets_array)
    snippets_array.each do |snippet|
      s = Snippet.find_or_initialize_by_name_and_version(snippet[:name],snippet[:version])
      s.description = snippet[:description]
      s.dependencies = snippet[:dependencies]
      s.code = snippet[:code]
      s.save!
    end
  end

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name, with: /^\w+$/
end
