# frozen_string_literal: true

require_relative '../entity/user'
require_relative '../storage/mysql2'
require_relative '../storage/mongodb'
require_relative '../storage/mysql2'
require_relative '../storage/mongodb'

# Agenda Repository Logic
class AgendaRepository
  attr_accessor :storage_client
  
  def initialize(storage_client:)
    @storage_client = storage_client
  end

  def read
    storage_client.read
  end
end
