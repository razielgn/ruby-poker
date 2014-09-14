require 'card_parser'

describe CardParser do
  describe '#parse_card' do
    it 'parses cards from ace to king of hearts' do
      expect(subject.parse_card('1h')).to  eq Card.new(1,  :h)
      expect(subject.parse_card('2h')).to  eq Card.new(2,  :h)
      expect(subject.parse_card('3h')).to  eq Card.new(3,  :h)
      expect(subject.parse_card('4h')).to  eq Card.new(4,  :h)
      expect(subject.parse_card('5h')).to  eq Card.new(5,  :h)
      expect(subject.parse_card('6h')).to  eq Card.new(6,  :h)
      expect(subject.parse_card('7h')).to  eq Card.new(7,  :h)
      expect(subject.parse_card('8h')).to  eq Card.new(8,  :h)
      expect(subject.parse_card('9h')).to  eq Card.new(9,  :h)
      expect(subject.parse_card('10h')).to eq Card.new(10, :h)
      expect(subject.parse_card('jh')).to  eq Card.new(11, :h)
      expect(subject.parse_card('qh')).to  eq Card.new(12, :h)
      expect(subject.parse_card('kh')).to  eq Card.new(13, :h)
    end

    it 'parses cards from ace to king of clubs' do
      expect(subject.parse_card('1c')).to  eq Card.new(1,  :c)
      expect(subject.parse_card('2c')).to  eq Card.new(2,  :c)
      expect(subject.parse_card('3c')).to  eq Card.new(3,  :c)
      expect(subject.parse_card('4c')).to  eq Card.new(4,  :c)
      expect(subject.parse_card('5c')).to  eq Card.new(5,  :c)
      expect(subject.parse_card('6c')).to  eq Card.new(6,  :c)
      expect(subject.parse_card('7c')).to  eq Card.new(7,  :c)
      expect(subject.parse_card('8c')).to  eq Card.new(8,  :c)
      expect(subject.parse_card('9c')).to  eq Card.new(9,  :c)
      expect(subject.parse_card('10c')).to eq Card.new(10, :c)
      expect(subject.parse_card('jc')).to  eq Card.new(11, :c)
      expect(subject.parse_card('qc')).to  eq Card.new(12, :c)
      expect(subject.parse_card('kc')).to  eq Card.new(13, :c)
    end

    it 'parses cards from ace to king of diamonds' do
      expect(subject.parse_card('1d')).to  eq Card.new(1,  :d)
      expect(subject.parse_card('2d')).to  eq Card.new(2,  :d)
      expect(subject.parse_card('3d')).to  eq Card.new(3,  :d)
      expect(subject.parse_card('4d')).to  eq Card.new(4,  :d)
      expect(subject.parse_card('5d')).to  eq Card.new(5,  :d)
      expect(subject.parse_card('6d')).to  eq Card.new(6,  :d)
      expect(subject.parse_card('7d')).to  eq Card.new(7,  :d)
      expect(subject.parse_card('8d')).to  eq Card.new(8,  :d)
      expect(subject.parse_card('9d')).to  eq Card.new(9,  :d)
      expect(subject.parse_card('10d')).to eq Card.new(10, :d)
      expect(subject.parse_card('jd')).to  eq Card.new(11, :d)
      expect(subject.parse_card('qd')).to  eq Card.new(12, :d)
      expect(subject.parse_card('kd')).to  eq Card.new(13, :d)
    end

    it 'parses cards from ace to king of spades' do
      expect(subject.parse_card('1s')).to  eq Card.new(1,  :s)
      expect(subject.parse_card('2s')).to  eq Card.new(2,  :s)
      expect(subject.parse_card('3s')).to  eq Card.new(3,  :s)
      expect(subject.parse_card('4s')).to  eq Card.new(4,  :s)
      expect(subject.parse_card('5s')).to  eq Card.new(5,  :s)
      expect(subject.parse_card('6s')).to  eq Card.new(6,  :s)
      expect(subject.parse_card('7s')).to  eq Card.new(7,  :s)
      expect(subject.parse_card('8s')).to  eq Card.new(8,  :s)
      expect(subject.parse_card('9s')).to  eq Card.new(9,  :s)
      expect(subject.parse_card('10s')).to eq Card.new(10, :s)
      expect(subject.parse_card('js')).to  eq Card.new(11, :s)
      expect(subject.parse_card('qs')).to  eq Card.new(12, :s)
      expect(subject.parse_card('ks')).to  eq Card.new(13, :s)
    end
  end

  describe '#parse_hand' do
    it 'parses multiple cards separated by a space' do
      hand = Hand.new([
        Card.new(1, :s), Card.new(13, :s), Card.new(10, :d),
        Card.new(5, :c), Card.new(13, :h)
      ])

      expect(subject.parse_hand('1s ks 10d 5c kh')).to eq hand
    end
  end
end
