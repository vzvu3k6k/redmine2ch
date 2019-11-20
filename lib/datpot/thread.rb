# frozen_string_literal: true

require 'datpot/response'

module Datpot
  class Thread < Struct.new(:dat_id, :title, :response_count, keyword_init: true)
    def responses
      [
        Response.new(author: '名無しさん', email: '', date: Date.today, content: 'てすと'),
        Response.new(author: '名無しさん', email: '', date: Date.today, content: '2get')
      ]
    end

    def dat
      "#{responses.first.dat}#{title}\n" +
        responses.drop(1).map(&:dat).join("\n") +
        "\n"
    end
  end
end
