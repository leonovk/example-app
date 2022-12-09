require 'puma-daemon'
root = "#{Dir.getwd}"
environment "production"

daemonize true

workers 3
preload_app!

threads_count = ENV.fetch('PUMA_THREADS') { 5 }.to_i
threads threads_count, threads_count

port ENV.fetch('PORT') { 3000 }

workers ENV.fetch('WORKERS') { 1 }.to_i
