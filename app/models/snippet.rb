class Snippet < ActiveRecord::Base
  attr_accessible :code, :dependencies, :description, :name, :variables, :version, :tag_list

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
  has_paper_trail
end
