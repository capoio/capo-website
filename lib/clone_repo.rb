def clone_repo
  # Set up Git repo
  begin
    repo = Git.open("#{Rails.root}/vendor/repo.git")
  rescue
    Git.clone("git@github.com:capoio/capo.git", "vendor/repo.git")
    retry
  end

  # Update repo
  repo.lib.send :command, "pull" # repo.pull is broken in git-1.2.5, see: https://github.com/schacon/ruby-git/issues/32

  # Copy to database
  require "#{Rails.root}/vendor/repo.git/raw_recipes"
  Recipe.sync_repo_to_db(RawRecipe.load_all)
end
