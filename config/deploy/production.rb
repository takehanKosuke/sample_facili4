server '202.182.110.75', user: fetch(:user), roles: %w[ web app db sidekiq cron ], primary: true
set :branch, 'master'
set :stage, :production
set :rails_env, :production
set :ssh_keys, ['~/.ssh/id_rsa']
set :pty, false
set :ssh_options, {
  keys: fetch(:ssh_keys).map { |x| File.expand_path(x) },
  forward_agent: true
}
