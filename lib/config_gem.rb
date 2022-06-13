# frozen_string_literal: true

require 'config_gem/version'

module ConfigGem
  class Error < StandardError; end
  class Config
    attr_accessor :attributes
    def initialize(attributes=nil)
      @attributes = attributes

      yield self if block_given?
    end

    def set(attributes = nil)
      @attributes = attributes
      yield self if block_given?
    end 

    def get(key)
      @attributes[key]
    end
  end
end
