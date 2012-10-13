# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# t.string   "name"
# t.text     "description"
# t.text     "code"
# t.string   "version"
# t.text     "variables" hash
# t.text     "dependencies" hash

%w(rails php defaults).each do |cat_name|
  Category.create(name: cat_name) unless Category.where(name: cat_name).any?
end

snippets = {
  default: {
    name: 'default',
    description: '',
    code: '
      # Set the user of your application
      set :user, "account_user"

      #Set the application name on the server
      set :application, "application_name"
      # Set the name of your branch
      set :branch, :master

      # The amount of release you want to keep
      set :keep_releases, 3

      # Do you deploy as a sudo user
      set :use_sudo, false

      # Set true if you deploy to a shared environment
      set :group_writable, false

      set :deploy_via, :remote_cache

      # Must be set for the password prompt from git to work
      default_run_options[:pty] = true

      # Where do you want to deploy
      set(:deploy_to) {"/home/#{user}/apps/#{application}"}

      # Default action to clean older versions
      after :deploy, "deploy:cleanup"
      ',
    version: '0.1',
    variables: [:user, :application, :branch, :keep_releases],
    dependencies: [],
    category_id: Category.where(name: 'defaults').first.id,
    tag_list: [:defaults, :configs]
  },
  rails_passenger: {
    name: 'rails_passenger',
    description: 'Rails passenger stuff',
    code: '
      namespace :passenger do
        desc "Restart the web server"
        task :restart, :roles => :app do
          run "touch  #{deploy_to}/current/tmp/restart.txt"
        end
      end

      namespace :deploy do
        desc "Restart your application"
        task :restart do
          passenger::restart
        end

        desc "Start your application"
        task :start do
          passenger::restart
        end
      end
      ',
    version: '0.1',
    variables: [],
    dependencies: [],
    category_id: Category.where(name: 'rails').first.id,
    tag_list: [:rails, :server]
  },
  rails_migrations: {
    name: 'rails_migrations',
    description: '',
    code: '
      desc \'Prompts if new migrations are available and runs them if you want to\'
      namespace :deploy do
        task :needs_migrations, :roles => :db, :only => {:primary => true} do
          migrations_changed = if previous_release.nil?
            true # propably first deploy, so no migrations to compare
          else
            old_rev = capture("cd #{previous_release} && git log --pretty=format:\'%H\' -n 1 | cat").strip
            new_rev = capture("cd #{latest_release} && git log --pretty=format:\'%H\' -n 1 | cat").strip
            capture("cd #{latest_release} && git diff #{old_rev} #{new_rev} --name-only | cat").include?(\'db/migrate\')
          end
          if migrations_changed && Capistrano::CLI.ui.ask("New migrations pending. Enter \'yes\' to run db:migrate") == \'yes\'
            migrate
          end
        end
      end
      after "deploy:update_code", "deploy:needs_migrations"
      ',
    version: '0.1',
    variables: [],
    dependencies: [],
    category_id: Category.where(name: 'rails').first.id,
    tag_list: [:rails, :database]
  },
  snippet: {
    name: 'default_bundler',
    description: '',
    code: %Q{require 'bundler/capistrano'},
    version: '0.1',
    variables: [],
    dependencies: [],
    category_id: Category.where(name: 'defaults').first.id,
    tag_list: [:rails, :bundler]
  },
  rails_env_configs: {
    name: 'rails_env_configs',
    description: 'Rails env config symlinks',
    code: '
      unless exists?(:configs)
        set :configs, [:database]
      end

      namespace :configs do
        namespace name do
          desc "Create #{name}.yml in shared/config"
          task :copy do
            run "mkdir -p #{shared_path}/config"

            CONFIG = YAML.load_file(%Q{./config/#{name}.yml})[rails_env.to_s]
            put CONFIG.map{|key, value| "#{key}: #{value}\n"}.join, "#{shared_path}/config/#{name}.yml"
          end

          desc "Link the #{name}.yml"
          task :link do
            run "ln -nfs #{shared_path}/config/#{name}.yml #{release_path}/config/#{name}.yml"
          end
        end

        after \'deploy:setup\', "configs:#{name}:copy"
        after \'deploy:finalize_update\', "configs:#{name}:link"
      end
      ',
    version: '0.1',
    variables: [:configs],
    dependencies: [],
    category_id: Category.where(name: 'rails').first.id,
    tag_list: [:rails, :configs]
  }
}

snippets.each do |snippet|
  # puts snippet[1]
  Recipe.create snippet[1]
end
