# frozen_string_literal: true

require 'datpot/refinements/string'

module Datpot
  class Response < Struct.new(:author, :email, :posted_at, :id, :content, keyword_init: true)
    using Datpot::Refinements::String

    def self.format_time(time)
      day = '日月火水木金土'[time.wday]
      time.strftime("%Y/%m/%d(#{day}) %H:%M:%S")
    end

    def dat
      "#{author.escape_dat}<>#{email.escape_dat}<>#{meta.escape_dat}<>#{content.escape_dat}<>\n"
    end

    private

    def meta
      str = self.class.format_time(posted_at)
      id ? "#{str} ID: #{id}" : str
    end
  end
end
