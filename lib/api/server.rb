# frozen_string_literal: true

require 'dotenv'
Dotenv.load
require 'sinatra'
require 'mysql2'
require 'sinatra/json'
require 'json'
require 'byebug'
require_relative '../storage/mysql2'
require_relative '../entity/user'


# server.rb
get '/' do
  database_name = 'agenda'
  database = Mysql2::Client.new(:host => ENV["DATABASE_HOST"], :username => ENV["DATABASE_USERNAME"], :password => ENV["DATABASE_pwd"], :database => ENV["DATABASE_NAME"])

   Mysql2Query.new(database: database, database_name: database_name).getAllUsers
end

post '/create' do
  database_name = 'agenda'

  database = Mysql2::Client.new(:host => ENV["DATABASE_HOST"], :username => ENV["DATABASE_USERNAME"], :password => ENV["DATABASE_pwd"], :database => ENV["DATABASE_NAME"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])

  Mysql2Query.new(database: database, database_name: database_name).add(user.name, user.email)
end

put '/update' do
  database_name = 'agenda'
  id = 1

  database = Mysql2::Client.new(:host => ENV["DATABASE_HOST"], :username => ENV["DATABASE_USERNAME"], :password => ENV["DATABASE_pwd"], :database => ENV["DATABASE_NAME"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: body['email'])

  # should I pass the id on update function or let it on mysql2.rb
  Mysql2Query.new(database: database, database_name: database_name).update(user.name, user.email)
end


delete '/delete' do
  database_name = 'agenda'

  database = Mysql2::Client.new(:host => ENV["DATABASE_HOST"], :username => ENV["DATABASE_USERNAME"], :password => ENV["DATABASE_PWD"], :database => ENV["DATABASE_NAME"])

  request.body.rewind 
  body = JSON.parse request.body.read
  user = User.new(name: body['name'], email: '')

  Mysql2Query.new(database: database, database_name: database_name).delete(user.name)
end
