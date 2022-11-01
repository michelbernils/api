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

  def get_all
    collection = client[:user]
    collection.find({})
  end

  def search(id)
    collection = client[:user]
    collection.find("id": BSON::ObjectId.from_string(id))
  end

  def create(category, name, email)
    collection = client[:user]
    
    doc = {category: category, name: name, email: email}
    collection.insert_one(doc)
  end

  def update(id, category, name, email)
    collection = client[:user]
    collection.update_one({:_id => BSON::ObjectId.from_string(id)}, '$set' => {:name => name})
    collection.update_one({:_id => BSON::ObjectId.from_string(id)}, '$set' => {:category => category})
    collection.update_one({:_id => BSON::ObjectId.from_string(id)}, '$set' => {:email => email})
  end

  def delete(id)
    collection = client[:user]
    collection.delete_one({:_id => BSON::ObjectId.from_string(id)})
  end
end
