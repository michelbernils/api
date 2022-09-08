# frozen_string_literal: true

require 'sinatra'
require 'mysql2'
require 'sinatra/json'
require 'json'
require_relative '../api/server'
require_relative '../storage/mysql2'
require_relative '../entity/user'

#Database class
class Mysql2Query
  attr_accessor :database, :database_name

  def initialize(database:, database_name:)
    @database = database
    @database_name = database_name
  end

  def getAllUsers
    @database.query("SELECT * FROM #{@database_name};")
  end
  
  def add(name, email)
    @database.query("INSERT INTO #{@database_name} (name, email) VALUES ('#{name}', '#{email}');")
  end

  def update(name, email)
    id = '5'

    @database.query("UPDATE #{database_name} SET NAME = '#{name}', EMAIL = '#{email}' WHERE ID = #{id};")
  end

  def delete(name)
    database.query("DELETE FROM AGENDA WHERE NAME = ('#{name}');")
  end
end
