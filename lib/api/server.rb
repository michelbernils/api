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

post '/create' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])
  
  request.body.rewind 
  body = JSON.parse request.body.read
  agenda = Agenda.new(database_name: body['database_name'])
  
  AgendaRepository.new(storage_client: config_manager.storage_client).start(agenda.database_name)
end

get '/agenda' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  AgendaRepository.new(storage_client: config_manager.storage_client).read
end

post '/agenda/create' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])
  category = body['category']

  UserRepository.new(storage_client: config_manager.storage_client).create(category, user.name, user.email)
end

post '/agenda/search' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: '')

  UserRepository.new(storage_client: config_manager.storage_client).search(user.name)
end

put '/agenda/update' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])
  id = body['id']
  category = body['category']

  UserRepository.new(storage_client: config_manager.storage_client).update(id, category, user.name, user.email)
end

delete '/agenda/delete' do
  config_manager = ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: '')
  UserRepository.new(storage_client: config_manager.storage_client).delete(user.name)
end