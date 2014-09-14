require 'hand'

describe Hand do
  describe '.new' do
    it 'raises InvalidHandError when given amount different than 5' do
      expect { described_class.new([]) }.to raise_error(InvalidHandError)
      expect { described_class.new([:a]) }.to raise_error(InvalidHandError)
      expect { described_class.new([:a, :b]) }.to raise_error(InvalidHandError)
      expect { described_class.new([:a, :b, :c]) }.to raise_error(InvalidHandError)
      expect { described_class.new([:a, :b, :c, :d]) }.to raise_error(InvalidHandError)
      expect { described_class.new([:a, :b, :c, :d, :e, :f]) }.to raise_error(InvalidHandError)
    end
  end

  describe '#rank' do
    def make_hand(string)
      CardParser.new.parse_hand(string)
    end

    context 'high card' do
      subject { make_hand('2h 3h 1h 5h 4h') }

      it 'returns :high_card' do
        expect(subject.rank).to eq :high_card
      end
    end
  end
end
