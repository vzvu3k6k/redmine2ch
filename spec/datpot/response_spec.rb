# frozen_string_literal: true

require 'datpot/response'

RSpec.describe Datpot::Response do
  describe '#dat' do
    subject { response.dat }

    let(:response) {
      Datpot::Response.new(
        author: '名無しさん',
        email: 'sage',
        posted_at: Time.utc(1999, 5, 30, 0, 0),
        id: 'mokorikomo',
        content: 'てすと'
      )
    }

    it { is_expected.to eq "名無しさん<>sage<>1999/05/30(日) 00:00:00<>てすと<>\n" }
  end
end
