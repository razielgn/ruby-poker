require 'poker/hand'

module Poker
  describe Hand do
    describe '.new' do
      it 'raises InvalidHandError when given amount different than 5' do
        expect {
          described_class.new([])
        }.to raise_error(InvalidHandError)

        expect {
          described_class.new([:a])
        }.to raise_error(InvalidHandError)

        expect {
          described_class.new([:a, :b])
        }.to raise_error(InvalidHandError)

        expect {
          described_class.new([:a, :b, :c])
        }.to raise_error(InvalidHandError)

        expect {
          described_class.new([:a, :b, :c, :d])
        }.to raise_error(InvalidHandError)

        expect {
          described_class.new([:a, :b, :c, :d, :e, :f])
        }.to raise_error(InvalidHandError)
      end
    end
  end
end
