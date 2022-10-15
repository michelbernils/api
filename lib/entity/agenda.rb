# frozen_string_literal: true

# This class contains all the Agenda implementation
class Agenda
  attr_accessor :database_name

  def initialize(database_name:)
    @database_name = database_name
  end
end
