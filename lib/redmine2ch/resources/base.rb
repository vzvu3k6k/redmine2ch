# frozen_string_literal: true

require 'datpot/bbs'

module Redmine2ch
  module Resources
    class Base
      def initialize(raw)
        @raw = raw
      end

      # TODO: Raise NoMethodError when @raw doesn't have the key
      def method_missing(name)
        @raw[name]
      end
    end
  end
end
