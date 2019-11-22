# frozen_string_literal: true

require 'ostruct'
require 'datpot/board'

RSpec.describe Datpot::Board do
  describe '#subject_txt' do
    subject { board.subject_txt }

    let(:board) {
      Datpot::Board.new(
        threads: [
          OpenStruct.new(subject_txt: "123.dat<>title (1)\n"),
          OpenStruct.new(subject_txt: "234.dat<>title2 (1001)\n")
        ]
      )
    }

    it {
      is_expected.to eq <<~HERE
        123.dat<>title (1)
        234.dat<>title2 (1001)
      HERE
    }
  end
end
