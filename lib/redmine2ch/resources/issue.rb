# frozen_string_literal: true

require 'datpot/bbs'
require 'redmine2ch/resources/base'

module Redmine2ch
  module Resources
    class Issue < Base
      def journals
        @raw[:journals].map { |raw| Journal.new(raw) }
      end

      def author
        @raw[:author][:name]
      end

      def created_on
        Time.parse(@raw[:created_on])
      end
    end
  end
end
