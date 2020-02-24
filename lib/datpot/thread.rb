# frozen_string_literal: true

require 'datpot/response'

module Datpot
  Thread = Struct.new(:thread_id, :title, :response_count, :responses, keyword_init: true) do
    def subject_txt
      "#{thread_id}.dat<>#{title} (#{response_count || responses.size})\n"
    end

    def dat
      first, *rest = responses
      ["#{first.dat.chomp}#{title}\n", *rest.map(&:dat)].join
    end
  end
end
