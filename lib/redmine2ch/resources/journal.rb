# frozen_string_literal: true

require 'datpot/bbs'
require 'redmine2ch/resources/base'

module Redmine2ch
  module Resources
    class Journal < Base
      def author
        @raw[:user][:name]
      end

      def created_on
        Time.parse(@raw[:created_on])
      end

      def details
        @raw[:details].map { |raw| Detail.new(raw) }
      end

      def content
        [detail_content, notes].compact.join("\n---\n")
      end

      private

      def detail_content
        return if details.empty?

        details.map(&:content).join("\n")
      end

      class Detail < Base
        def content
          "#{name}: #{old_value || "(NULL)"} -> #{new_value || "(NULL)"}"
        end
      end
    end
  end
end
