# frozen_string_literal: true

require 'sinatra'
require 'mysql2'
require 'sinatra/json'
require 'json'
require_relative '../api/server'
require_relative '../storage/mysql2'
require_relative '../entity/user'
require_relative '../entity/agenda'

#Database class
class MySql2
  attr_accessor :database, :database_name

  def initialize(database:, database_name:)
    @database = database
    @database_name = database_name
  end

  def get_all
    database.query("SELECT * FROM #{@database_name};")
  end
  
  def search(id)
    database.query("SELECT * FROM #{@database_name} WHERE ID = '#{id}';")
  end

  def create(category, name, email)
    database.query("INSERT INTO #{@database_name} (category, name, email) VALUES ('#{category}', '#{name}', '#{email}');")
  end

  def update(id, category, name, email)
    database.query("UPDATE #{@database_name} SET CATEGORY = '#{category}', NAME = '#{name}', EMAIL = '#{email}' WHERE ID = #{id};")
  end

  def delete(id)
    database.query("DELETE FROM AGENDA WHERE ID = ('#{id}');")
  end
end
