# frozen_string_literal: true

require 'redmine2ch/resources/journal'

RSpec.describe Redmine2ch::Resources::Journal do
  describe '#content' do
    subject { journal.content }

    context 'With notes' do
      let(:journal) { described_class.new(notes: 'Journal notes', details: []) }

      it 'returns notes' do
        is_expected.to eq 'Journal notes'
      end
    end

    context 'With attr details' do
      let(:journal) {
        detail = {
          property: 'attr',
          name: 'due_date',
          old_value: nil,
          new_value: '2022-01-21'
        }
        described_class.new(details: [detail])
      }

      it 'returns notes' do
        is_expected.to eq <<~CONTENT.chomp
          due_date: (NULL) -> 2022-01-21
        CONTENT
      end
    end

    context 'With attr details and notes' do
      let(:journal) {
        detail = {
          property: 'attr',
          name: 'due_date',
          old_value: nil,
          new_value: '2022-01-21'
        }
        described_class.new(details: [detail], notes: 'Journal notes')
      }

      it 'returns notes' do
        is_expected.to eq <<~CONTENT.chomp
          due_date: (NULL) -> 2022-01-21
          ---
          Journal notes
        CONTENT
      end
    end
  end
end
