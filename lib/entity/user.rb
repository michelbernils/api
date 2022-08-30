# frozen_string_literal: true

#User class
class User
  attr_accessor :name, :email

  def initialize(name:, email:)
    @name = name
    @email = email
  end
end
