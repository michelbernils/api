# frozen_string_literal: true

require 'dotenv'
Dotenv.load
require 'sinatra'
require 'mysql2'
require 'mongo'
require 'byebug'

require_relative '../storage/mysql2'
require_relative '../storage/mongodb'
require_relative '../entity/user'
require_relative '../repository/agenda_repository'
require_relative '../repository/user_repository'
require_relative '../config_manager'

# server.rb
get '/' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  AgendaRepository.new(storage_client: config_manager.storage_client).read
end

post '/create' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])

  UserRepository.new(storage_client: config_manager.storage_client).create(user.name, user.email)
end

put '/update' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])
  id = body['id']
  UserRepository.new(storage_client: config_manager.storage_client).update(id, user.name, user.email)
end

delete '/delete' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: '')
  UserRepository.new(storage_client: config_manager.storage_client).delete(user.name)
end
