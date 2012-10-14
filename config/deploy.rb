set :application, "capo"
set :repository,  "git@github.com:railsrumble/r12-team-91.git"
set :branch,      "master"

server 'capo.io', :app, :web, :db, primary: true
