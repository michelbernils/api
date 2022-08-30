# frozen_string_literal: true

require 'mysql2'

#Database class
class Database
  attr_accessor :host, :username, :password, :database_name

  def initialize(host: 'localhost', username: 'root', password: '', database_name: 'agenda')
    @host = host
    @username = username
    @password = password
    @database_name = database_name
  end

  def connect
    Mysql2::Client.new(:host => @host, :username => @username, :password => @password, :database => @database_name)
  end
end
