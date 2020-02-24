# frozen_string_literal: true

require 'datpot/thread'

module Datpot
  Board = Struct.new(:threads, keyword_init: true) do
    def subject_txt
      threads.map(&:subject_txt).join
    end
  end
end
