# frozen_string_literal: true

# Agenda Repository class
class AgendaRepository
  attr_accessor :storage_client

  def initialize(storage_client:)
    @storage_client = storage_client
  end

  

end