# frozen_string_literal: true

require_relative '../entity/user'
require_relative '../entity/agenda'
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

  def start(name)
    storage_client.start(name)
  end

  private

  def agenda_repository
    @agenda_repository ||= AgendaRepository.new(storage_client: config_manager.storage_client)
  end
end
