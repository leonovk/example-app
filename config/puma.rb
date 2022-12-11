require 'puma-daemon'
require 'dotenv-vault/load'

root = "#{Dir.getwd}"

if ENV['ENVIRONMENT'].nil?
  environment 'development'
else
  environment ENV['ENVIRONMENT']
end

daemonize true if ENV['ENVIRONMENT'] == 'production'

workers 3
preload_app!

threads_count = ENV.fetch('PUMA_THREADS') { 5 }.to_i
threads threads_count, threads_count

port ENV.fetch('PORT') { 3000 }

workers ENV.fetch('WORKERS') { 1 }.to_i
