require 'dotenv'
Dotenv.load
require 'sinatra'
require 'mysql2'
require 'mongo'
require 'byebug'

require_relative '../lib/api/server'

# Config manager class
class ConfigManager
  attr_accessor :storage_type

  def initialize(storage_type:)
    @storage_type = storage_type
  end

  def storage_client
    client_mysql2 = Mysql2::Client.new(:host => ENV["DATABASE_HOST_MYSQL2"], :username => ENV["DATABASE_USERNAME_MYSQL2"], :password => ENV["DATABASE_PWD_MYSQL2"], :database => ENV["DATABASE_NAME_MYSQL2"])

    client_mongodb = Mongo::Client.new([ENV["DATABASE_HOST_MONGODB"]], :database => ENV["DATABASE_NAME_MONGODB"])

    case storage_type
    when 'mysql2'
      MySql2.new(database: client_mysql2, database_name: ENV["DATABASE_NAME_MYSQL2"])
    when 'mongodb'
      Mongodb.new(client: client_mongodb, database_name: ENV["DATABASE_NAME_MONGODB"])
    else
      :error
    end
  end
end