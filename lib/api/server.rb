# frozen_string_literal: true

require 'sinatra'
require 'mysql2'
require 'sinatra/json'
require 'json'
require_relative '../entity/database'
require_relative '../entity/user'

# server.rb
get '/' do
  client = Database.new.connect
  result = client.query("SELECT * FROM AGENDA;")
  result.each { |x| puts x }
end

get '/contact/:id' do
  
end

def getBody(req)
  req.body.rewind
  JSON.parse(req.body.read)
end

put '/update-contact' do
  client = Database.new.connect
  body = getBody(request)
  id = 1
  user = User.new(name: body["name"], email: body["email"])
  result = client.query("UPDATE AGENDA SET NAME = '#{user.name}', EMAIL = '#{user.email}' WHERE ID = #{id};")
end

post '/create-contact' do
  client = Database.new.connect
  body = getBody(request)
  user = User.new(name: body["name"], email: body["email"])
  result = client.query("INSERT INTO AGENDA (name, email) VALUES ('#{user.name}', '#{user.email}');")
end

delete '/delete-contact' do
  client = Database.new.connect
  body = getBody(request)
  user = User.new(name: body["name"], email: body["email"])
  result = client.query("DELETE FROM AGENDA WHERE NAME = ('#{user.name}');")
end
