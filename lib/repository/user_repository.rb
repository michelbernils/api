# frozen_string_literal: true

require_relative '../entity/user'

# User Repository Logic
class UserRepository
  attr_accessor :storage_client

  def initialize(storage_client:)
    @storage_client = storage_client
  end

  def read
    storage_client.read
  end

  def create(name, email)
    storage_client.create(name, email)

    User.new(name: name, email: email)
  end

  def update(id, name, email)
    storage_client.update(id, name, email)

    User.new(name: name, email: email)
  end

  def delete(name)
    storage_client.delete(name)
  end
end
