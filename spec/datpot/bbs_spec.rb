# frozen_string_literal: true

require 'datpot/bbs'
require 'datpot/thread'
require 'datpot/response'
require 'rack/test'

RSpec.describe Datpot::Bbs do
  include Rack::Test::Methods

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
        Datpot::Response.new(author: '名無しさん', email: '', date: Date.new(2019, 1, 1), content: 'てすと'),
        Datpot::Response.new(author: '名無しさん', email: '', date: Date.new(2019, 1, 2), content: '2get')
      ]
    end
  end

  let(:app) { App.new }
  let(:decoded_body) { response.body.encode('utf-8', 'cp932') }

  describe 'GET /redmine/subject.txt' do
    let(:response) { get '/redmine/subject.txt' }

    it { expect(response.status).to eq 200 }
    it { expect(decoded_body).to eq "1234.dat<> (1001)\n" }
  end

  describe 'GET /redmine/dat/1234.dat' do
    let(:response) { get '/redmine/dat/1234.dat' }

    it { expect(response.status).to eq 200 }
    it {
      expect(decoded_body).to eq <<~DAT
        名無しさん<><>2019-01-01<>てすと<>
        名無しさん<><>2019-01-02<>2get<>
      DAT
    }
  end
end
