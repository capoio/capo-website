namespace :capo do
  desc "Update capo-recipes repository and import in the database"
  task :import_repo => :environment do
    require 'import_repo'
    import_repo
  end
end
