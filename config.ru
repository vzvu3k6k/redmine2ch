# frozen_string_literal: true

require 'datpot/bbs'

class App < Datpot::Bbs
  def subject_txt(*)
    Datpot::Board.new.subject_txt
  end

  def dat(*)
    Datpot::Thread.new.dat
  end
end

run App
