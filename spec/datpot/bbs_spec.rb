# frozen_string_literal: true

require 'datpot/bbs'
require 'rack/test'

RSpec.describe Datpot::Bbs do
  include Rack::Test::Methods

  class App < Datpot::Bbs
    def subject_txt(*)
      Datpot::Board.new.subject_txt
    end

    def dat(*)
      Datpot::Thread.new.dat
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
        名無しさん<><>2019-11-22<>てすと<>
        名無しさん<><>2019-11-22<>2get<>
      DAT
    }
  end
end
