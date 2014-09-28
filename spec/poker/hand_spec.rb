require 'poker/hand'

module Poker
  describe Hand do
    describe '.new' do
      let(:cards) {
        [
          card('1h'),
          card('2h'),
          card('3h'),
          card('4h'),
          card('5h'),
          card('6h'),
        ]
      }

      it 'raises InvalidHandError for no cards' do
        expect do
          described_class.new(cards.take(0))
        end.to raise_error(InvalidHandError)
      end

      it 'raises InvalidHandError for one card' do
        expect do
          described_class.new(cards.take(1))
        end.to raise_error(InvalidHandError)
      end

      it 'raises InvalidHandError for two cards' do
        expect do
          described_class.new(cards.take(2))
        end.to raise_error(InvalidHandError)
      end

      it 'raises InvalidHandError for three cards' do
        expect do
          described_class.new(cards.take(3))
        end.to raise_error(InvalidHandError)
      end

      it 'raises InvalidHandError for four cards' do
        expect do
          described_class.new(cards.take(4))
        end.to raise_error(InvalidHandError)
      end

      it 'raises InvalidHandError for six cards' do
        expect do
          described_class.new(cards.take(6))
        end.to raise_error(InvalidHandError)
      end

      it 'does not raise InvalidHandError for five cards' do
        expect do
          described_class.new(cards.take(5))
        end.not_to raise_error
      end
    end
  end
end
