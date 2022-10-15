# frozen_string_literal: true

require 'mongo'
require 'sinatra'
require 'sinatra/json'
require 'json'

require_relative '../api/server'
require_relative '../entity/user'

class Mongodb
  attr_accessor :client, :database_name

  def initialize(client:, database_name:)
    @client = client
    @database_name = database_name
  end

  def start(database_name)
    :not_implemented
  end

  def read
    collection = client[:user]
    collection.find({})
  end

  def search(name)
    collection = client[:user]
    collection.find({"name": name})
  end

  def create(name, email)
    collection = client[:user]
    
    doc = {name: name, email: email}
    collection.insert_one(doc)
  end

  def update(id, name, email)
    collection = client[:user]
    collection.update_one({:_id => BSON::ObjectId.from_string(id)}, '$set' => {:name => name})
    collection.update_one({:_id => BSON::ObjectId.from_string(id)}, '$set' => {:email => email})
  end

  def delete(name)
    collection = client[:user]
    collection.delete_one("name": name)
  end
end
