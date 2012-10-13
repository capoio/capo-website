def sync_repo_to_db(snippets_array)

  snippets_array.each do |snippet|
    s = Snippet.new
    s.name = snippet[:name]
    s.version = snippet[:version]
    s.description = snippet[:description]
    s.dependencies = snippet[:dependencies]
    s.code = snippet[:code]
    s.save!
  end

end
