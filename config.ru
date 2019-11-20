# frozen_string_literal: true

require 'bbs'

class App < Bbs
  def subject_txt(*)
    Datpot::Board.new.subject_txt
  end

  def dat(*)
    Datpot::Thread.new.dat
  end
end

run App
