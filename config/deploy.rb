set :application, "capo"
set :repository,  "git@github.com:capoio/capo-website.git"
set :branch,      "master"

server 'capo.io', :app, :web, :db, primary: true
