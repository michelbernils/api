# frozen_string_literal: true

require_relative '../entity/user'

# User Repository Logic
class UserRepository
  attr_accessor :storage_client

  def initialize(storage_client:)
    @storage_client = storage_client
  end

  def start(name)
    storage_client.start(name)
  end

  def read
    storage_client.read
  end

  def search(name)
    storage_client.search(name)
  end

  def create(category, name, email)
    storage_client.create(category, name, email)

    User.new(name: name, email: email)
  end

  def update(id, category, name, email)
    storage_client.update(id, category, name, email)

    User.new(name: name, email: email)
  end

  def delete(name)
    storage_client.delete(name)
  end

  private 

  def user_repository
    @user_repository ||= UserRepository.new(storage_client: config_manager.storage_client)
  end
end
