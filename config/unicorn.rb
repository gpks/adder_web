# define paths and filenames
deploy_to = "/home/app/adder_web"
rails_root = "#{deploy_to}/current"
pid_file = "#{deploy_to}/shared/pids/unicorn.pid"
socket_file= "#{deploy_to}/shared/unicorn.sock"
log_file = "#{rails_root}/log/unicorn.log"
err_log = "#{rails_root}/log/unicorn_error.log"
old_pid = pid_file + '.oldbin'
working_directory rails_root

# worker_processes 3
# working_directory current_path
# listen "/var/tmp/unicorn.sock", backlog: 64
# timeout 180

# pid "#{shared_path}/tmp/pids/unicorn.pid"

# stderr_path "#{shared_path}/log/unicorn.stderr.log"
# stdout_path "#{shared_path}/log/unicorn.stdout.log"

before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = "#{current_path}/Gemfile"
end

timeout 30
worker_processes 2 # increase or decrease
listen socket_file, :backlog => 1024

pid pid_file
stderr_path err_log
stdout_path log_file

# make forks faster

# make sure that Bundler finds the Gemfile
# before_exec do |server|
#   ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', File.dirname(__FILE__))
# end

before_fork do |server, worker|

  # zero downtime deploy magic:
  # if unicorn is already running, ask it to start a new process and quit.
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end
