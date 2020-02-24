# frozen_string_literal: true

require 'datpot/bbs'

module Redmine2ch
  module Resources
    class Base
      def initialize(raw)
        @raw = raw
      end

      def dig(*args)
        @raw.dig(*args)
      end
    end
  end
end
