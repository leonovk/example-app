# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'dotenv-vault/load'

class App < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/hello/:name' do
    "Hello #{params['name']}!"
  end

  get '/json' do
    json({ 'a' => 'b' })
  end
end
