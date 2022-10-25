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


# PUT /user/:id => Atualiza user de :id  
# POST /user => Cria (done)
# GET /user => todos users retorna (não funciona)
# GET /user/:id => retorna o user de :id 
# DELETE /user/:id => exclui o user de :id

# 1) retorna um todos os users (funcionando)
get '/user' do
  agenda_repository.read
end

get '/user/:id' do
  user_repository.search(params[:id])
end

post '/user' do
  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])
  category = body['category']

  user_repository.create(category, user.name, user.email)
end

delete '/user/:id' do
  user_repository.delete(params[:id])
end

# 5) atualiza 
put '/user/:id' do
  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])
  category = body['category']
  
  user_repository.update(params[:id], category, user.name, user.email)
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