require 'card'

describe Card do
  describe '.new' do
    it 'raises InvalidCardError when invalid' do
      expect { described_class.new(0, nil) } .to raise_error(InvalidCardError)
      expect { described_class.new(1, nil) } .to raise_error(InvalidCardError)
      expect { described_class.new(1, :g)  } .to raise_error(InvalidCardError)
      expect { described_class.new(14, :h) } .to raise_error(InvalidCardError)
      expect { described_class.new(0, :h)  } .to raise_error(InvalidCardError)
    end
  end

  describe '#pips' do
    subject { card '5h' }

    it 'returns the pips' do
      expect(subject.pips).to be 5
    end
  end
end
