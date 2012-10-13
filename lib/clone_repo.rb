def clone_repo
  # Set up Git repo
  begin
    repo = Git.open("#{Rails.root}/vendor/repo.git")
  rescue
    Git.clone("https://github.com/capoio/capo.git", "vendor/repo.git")
    retry
  end
  repo.pull

  # Make sure we have the recipes script
  recipes_script = "#{Rails.root}/lib/recipes.rb"

  if !File.exists?(recipes_script)
    FileUtils.symlink("#{Rails.root}/vendor/repo.git/recipes.rb", recipes_script)
  end
end
