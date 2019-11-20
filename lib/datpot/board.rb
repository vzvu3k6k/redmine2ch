# frozen_string_literal: true

require 'datpot/thread'

module Datpot
  class Board
    def threads
      [
        Thread.new(
          dat_id: 1234,
          title: '',
          response_count: 1001
        )
      ]
    end

    def subject_txt
      threads.map { |thread|
        "#{thread.dat_id}.dat<>#{thread.title} (#{thread.response_count})"
      }.join("\n") + "\n"
    end
  end
end
