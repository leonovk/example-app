# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'

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

