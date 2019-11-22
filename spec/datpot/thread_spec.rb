# frozen_string_literal: true

require 'datpot/board'

RSpec.describe Datpot::Thread do
  describe '#subject_txt' do
    subject { thread.subject_txt }

    context 'With response_count' do
      let(:thread) {
        Datpot::Thread.new(
          thread_id: 123,
          title: 'title',
          response_count: 1
        )
      }

      it { is_expected.to eq "123.dat<>title (1)\n" }
    end

    context 'With responses' do
      let(:thread) {
        Datpot::Thread.new(
          thread_id: 123,
          title: 'title',
          responses: [Object.new]
        )
      }

      it { is_expected.to eq "123.dat<>title (1)\n" }
    end
  end
end
