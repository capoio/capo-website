every 5.minutes do
  rake 'capo:import_repo', output: 'log/import_repo.log'
end
