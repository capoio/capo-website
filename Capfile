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

require 'openminds_deploy/defaults'
require 'openminds_deploy/git'
require 'openminds_deploy/rails3'
