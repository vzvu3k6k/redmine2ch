# frozen_string_literal: true

require 'datpot/bbs'
require 'redmine2ch/resources/base'

module Redmine2ch
  module Resources
    class Journal < Base
      def author
        dig(:user, :name)
      end

      def created_on
        Time.parse(dig(:created_on))
      end

      def content
        [detail_content, notes].compact.join("\n---\n")
      end

      private

      def notes
        dig(:notes)
      end

      def detail_content
        return if details.empty?

        details.map(&:content).join("\n")
      end

      def details
        dig(:details).map { |raw| Detail.new(raw) }
      end

      class Detail < Base
        def content
          "#{dig(:name)}: #{dig(:old_value) || "(NULL)"} -> #{dig(:new_value) || "(NULL)"}"
        end
      end
    end
  end
end
