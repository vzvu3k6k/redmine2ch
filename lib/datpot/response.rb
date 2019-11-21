# frozen_string_literal: true

module Datpot
  class Response < Struct.new(:author, :email, :date, :id, :content, keyword_init: true)
    def dat
      "#{author}<>#{email}<>#{date}<>#{content}<>\n"
    end
  end
end
