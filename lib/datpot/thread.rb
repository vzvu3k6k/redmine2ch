# frozen_string_literal: true

require 'datpot/response'

module Datpot
  class Thread < Struct.new(:thread_id, :title, :response_count, :responses, keyword_init: true)
    def subject_txt
      "#{thread_id}.dat<>#{title} (#{response_count || responses.size})"
    end

    def dat
      "#{responses.first.dat}#{title}\n" +
        responses.drop(1).map(&:dat).join("\n") +
        "\n"
    end
  end
end
