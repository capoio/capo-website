load 'deploy'
require 'airbrake/capistrano'
load 'deploy/assets'

set :user, 'capo'
set :application, :capo
server 'capo.io', :app, :web, :db, primary: true

set :repository, 'git@github.com:railsrumble/r12-team-91.git'
set :branch, :master
set :rails_env, :production

set :normalize_asset_timestamps, false

set :whenever_command, "bundle exec whenever"

require 'openminds_deploy/defaults'
require 'openminds_deploy/git'
require 'openminds_deploy/rails3'
require "whenever/capistrano"

namespace :puma do
  desc 'Restart the web server'
  task :restart, :roles => :app do
    run "killall puma && cd /home/capo/capo && /usr/bin/puma -e production -b unix:///tmp/sockets/capo.sock 2>&1 >> /home/capo/logs/capo.log &"
  end

  desc 'Stop the web server'
  task :stop, :roles => :app do
    run 'kill `ps x | grep puma | cut -c1-5 | head -1`'
  end

  desc 'Start the web server'
  task :start, :roles => :app do
    run 'cd /home/capo/capo && /usr/bin/puma -e production -b unix:///tmp/sockets/capo.sock 2>&1 >> /home/capo/logs/capo.log'
  end
end

namespace :deploy do
  desc 'Restart your application'
  task :restart do
    puma::restart
  end
end
