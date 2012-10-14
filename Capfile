load 'deploy'

load 'config/deploy'

load 'config/deploy/bundler'
load 'config/deploy/default'
load 'config/deploy/git_default'
load 'config/deploy/rails_assets_precompile'
load 'config/deploy/rails_env_configs'
load 'config/deploy/rails_migrations'
load 'config/deploy/ssh_default'
load 'config/deploy/tail_log'
load 'config/deploy/ruby_whenever'
load 'config/deploy/airbrake'

namespace :puma do
  desc 'Restart the web server'
  task :restart, :roles => :app do
    run "kill -9 `pgrep puma` && rm /tmp/sockets/capo.sock && cd /home/capo/capo && /usr/bin/puma -e production -b unix:///tmp/sockets/capo.sock 2>&1 >> /home/capo/logs/capo.log &"
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
