set :repository, 'git@github.com:capoio/capo-website.git'

server 'pro-007.openminds.be', :app, :web, :db, primary: true
set :user, 'capo'
set :application, 'default_app'
