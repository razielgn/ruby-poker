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
    context 'high card' do
      subject { hand '2h 3h 1h 5h 4h' }

      it 'returns :high_card' do
        expect(subject.rank).to eq :high_card
      end
    end

    context 'one pair' do
      subject { hand '2h 3h 1h 3d 4h' }

      it 'returns :one_pair' do
        expect(subject.rank).to eq :one_pair
      end
    end

    context 'two pairs' do
      subject { hand '2h 3h 2c 3d 4h' }

      it 'returns :two_pairs' do
        expect(subject.rank).to eq :two_pairs
      end
    end
  end
end
