lock '3.11.0'

set :application, 'facili'
set :repo_url, 'git@github.com:takehanKosuke/sample_facili4'
set :user, 'deploy'

# optional
set :unicorn_config_path, 'config/unicorn.rb'
# set :sidekiq_config, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/current/config/sidekiq.yml"
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# set :whenever_roles, -> { :cron }
# set :slackistrano, {
#   channel: '#in-corp',
#   webhook: 'https://hooks.slack.com/services/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'
# }

# common
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :linked_dirs, %w[ log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/shared public/uploads ]

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
