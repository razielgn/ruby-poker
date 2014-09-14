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
      subject { hand '2h 3d kd 5h 4h' }

      example do
        expect(subject.rank).to be :high_card
      end
    end

    context 'one pair' do
      subject { hand '2h 3h 1h 3d 4h' }

      example do
        expect(subject.rank).to be :one_pair
      end
    end

    context 'two pairs' do
      subject { hand '2h 3h 2c 3d 4h' }

      example do
        expect(subject.rank).to be :two_pairs
      end
    end

    context 'three of a kind' do
      subject { hand '3d 2h 2s 4h 2c' }

      example do
        expect(subject.rank).to be :three_of_a_kind
      end
    end

    context 'straight' do
      context 'ten-high' do
        subject { hand '10s 9d 8h 7s 6c' }

        example do
          expect(subject.rank).to be :straight
        end
      end

      context 'wheel' do
        subject { hand '1c 2s 3h 4d 5s' }

        example do
          expect(subject.rank).to be :straight
        end
      end

      context 'ace-high' do
        subject { hand '1s ks qd jc 10c' }

        example do
          expect(subject.rank).to be :straight
        end
      end

      context 'wrap around' do
        subject { hand '3c 2d 1h kc qs' }

        example do
          expect(subject.rank).not_to be :straight
        end
      end

      context 'less than two suits' do
        subject { hand '10s 9s 8s 7s 6s' }

        example do
          expect(subject.rank).not_to be :straight
        end
      end
    end

    context 'flush' do
      subject { hand '10s 9s 8s 7s 5s' }

      context 'same suit, not in sequence' do
        example do
          expect(subject.rank).to be :flush
        end
      end

      context 'same suit, in sequence' do
        subject { hand '10s 9s 8s 7s 6s' }

        example do
          expect(subject.rank).not_to be :flush
        end
      end
    end

    context 'full house' do
      subject { hand '10s 10h 10d 4s 4d' }

      example do
        expect(subject.rank).to be :full_house
      end
    end

    context 'four of a kind' do
      subject { hand '10s 10h 10d 10c 4d' }

      example do
        expect(subject.rank).to be :four_of_a_kind
      end
    end

    context 'straight flush' do
      context 'ten-high' do
        subject { hand '10s 9s 8s 7s 6s' }

        example do
          expect(subject.rank).to be :straight_flush
        end
      end

      context 'wheel' do
        subject { hand '1c 2c 3c 4c 5c' }

        example do
          expect(subject.rank).to be :straight_flush
        end
      end

      context 'ace-high' do
        subject { hand '1s ks qs js 10s' }

        example do
          expect(subject.rank).to be :straight_flush
        end
      end

      context 'wrap around' do
        subject { hand '3c 2c 1c kc qc' }

        example do
          expect(subject.rank).not_to be :straight_flush
        end
      end
    end
  end
end
