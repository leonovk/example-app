require 'puma-daemon'
root = "#{Dir.getwd}"
environment "production"

daemonize true

activate_control_app "tcp://127.0.0.1:9293"
bind "unix://#{root}/tmp/puma.sock"
pidfile "#{root}/tmp/pids/puma.pid"
rackup "#{root}/config.ru"
state_path "#{root}/tmp/pids/puma.state"

threads_count = ENV.fetch('PUMA_THREADS') { 5 }.to_i
threads threads_count, threads_count

port ENV.fetch('PORT') { 3000 }

workers ENV.fetch('WORKERS') { 1 }.to_i
