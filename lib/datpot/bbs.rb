# frozen_string_literal: true

require 'sinatra/base'
require 'datpot/board'

module Datpot
  class Bbs < Sinatra::Application
    def threads(board_id:)
      raise NotImplementedError
    end

    def responses(board_id:, thread_id:)
      raise NotImplementedError
    end

    get '/:board_id/subject.txt' do
      content_type 'plain/text'
      board = Datpot::Board.new(
        threads: threads(board_id: params['board_id'])
      )
      board.subject_txt.encode('cp932')
    end

    get '/:board_id/dat/:thread_id.dat' do
      content_type 'plain/text'
      thread = Datpot::Thread.new(
        responses: responses(
          board_id: params['board_id'],
          thread_id: params['thread_id']
        )
      )
      thread.dat.encode('cp932')
    end
  end
end
