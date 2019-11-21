# frozen_string_literal: true

require 'datpot/thread'

module Datpot
  class Board < Struct.new(:threads, keyword_init: true)
    def subject_txt
      threads.map(&:subject_txt).join
    end
  end
end
