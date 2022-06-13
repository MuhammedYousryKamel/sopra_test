# frozen_string_literal: true

require 'config_gem/version'

module ConfigGem
  class Error < StandardError; end
  class Config
    attr_accessor :attributes
    def initialize(attributes={})
      @attributes = attributes

      yield self if block_given?
    end

    def set(key = nil, value = nil)
      attributes[key] = value
      yield self if block_given?
    end 

    def get(key)
      @attributes[key]
    end
  end
end
