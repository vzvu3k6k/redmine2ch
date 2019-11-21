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
      Datpot::Response.new(author: '名無しさん', email: '', date: Date.today, content: 'てすと'),
      Datpot::Response.new(author: '名無しさん', email: '', date: Date.today, content: '2get')
    ]
  end
end

run App
