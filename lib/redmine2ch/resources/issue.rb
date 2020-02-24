# frozen_string_literal: true

require 'datpot/bbs'
require 'redmine2ch/resources/base'

module Redmine2ch
  module Resources
    class Issue < Base
      def id
        dig(:id)
      end

      def subject
        dig(:subject)
      end

      def author
        dig(:author, :name)
      end

      def created_on
        Time.parse(dig(:created_on))
      end

      def description
        dig(:description)
      end

      def journals
        dig(:journals).map { |raw| Journal.new(raw) }
      end
    end
  end
end
