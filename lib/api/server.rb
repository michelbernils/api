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
  agenda_repository.read
end

post '/agenda/create' do
  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])
  category = body['category']

  user_repository.create(category, user.name, user.email)
end

post '/agenda/search' do
  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: '')

  user_repository.search(user.name)
end

put '/agenda/update' do
  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])
  id = body['id']
  category = body['category']


  user_repository.update(id, category, user.name, user.email)
end

delete '/agenda/delete' do
  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: '')
  user_repository.delete(user.name)
end

private 

def config_manager
  @config_manager ||= ConfigManager.new(storage_type: ENV["DATABASE_STORAGE_TYPE"])
end

def agenda_repository
  @agenda_repository ||= AgendaRepository.new(storage_client: config_manager.storage_client)
end

def user_repository
  @user_repository ||= UserRepository.new(storage_client: config_manager.storage_client)
end