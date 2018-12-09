require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano3/unicorn'
require 'capistrano/rbenv'

set :rbenv_ruby, '2.5.0'

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
