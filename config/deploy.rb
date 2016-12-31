# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "adder_web"
set :repo_url, "git@github.com:gpks/adder_web.git"
set :user, "app"
set :ssh_options, { forward_agent: true }

#unicorn needs this :/
set :rails_env, :production

set :rvm1_ruby_version, 'ruby-2.3.3@default'
set :rvm1_map_bins,     %w{rake bundle ruby}
# do not use sudo
set :use_sudo, false
set(:run_method) { use_sudo ? :sudo : :run }

# This is needed to correctly handle sudo password prompt
# default_run_options[:pty] = true

# set :group, user
# set :runner, user

set :host, "#{fetch(:user)}@ksionex.tk" # We need to be able to SSH to that box as this user.
# role :web, host
role :app, "#{fetch(:host)}"
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets}
# puts "#{fetch(:host)}"
# Where will it be located on a server?
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :unicorn_conf, "#{fetch(:deploy_to)}/current/config/unicorn.rb"
set :unicorn_pid, "#{fetch(:deploy_to)}/shared/pids/unicorn.pid"

set :rack_env, :production

# Unicorn control tasks
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
  # task :start do
  #   run "cd #{fetch(:deploy_to)}/current && bundle exec unicorn -c #{fetch(:unicorn_conf)} -E #{fetch(:rake_env)} -D"
  # end
  # task :stop do
  #   run "if [ -f #{fetch(:unicorn_pid)} ]; then kill -QUIT `cat #{fetch(:unicorn_pid)}`; fi"
  # end
end

after 'deploy:publishing', 'deploy:restart'
