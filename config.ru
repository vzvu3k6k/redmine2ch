# frozen_string_literal: true

require 'datpot/bbs'
require 'datpot/thread'
require 'datpot/response'

class App < Datpot::Bbs
  def threads(board_id:)
    [
      Datpot::Thread.new(
        thread_id: 1234,
        title: '',
        response_count: 1001
      )
    ]
  end

  def responses(board_id:, thread_id:)
    [
      Datpot::Response.new(
        author: '名無しさん',
        email: '',
        posted_at: Time.utc(1999, 5, 30, 0, 0),
        content: 'てすと'
      ),
      Datpot::Response.new(
        author: '名無しさん',
        email: '',
        posted_at: Time.utc(1999, 5, 31, 0, 0),
        content: '2get'
      )
    ]
  end
end

run App
