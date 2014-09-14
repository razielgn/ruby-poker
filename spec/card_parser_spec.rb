require 'card_parser'

describe CardParser do
  describe '#parse_card' do
    it 'parses cards from ace to king of hearts' do
      expect(card '1h').to  eq Card.new(1,  :h)
      expect(card '2h').to  eq Card.new(2,  :h)
      expect(card '3h').to  eq Card.new(3,  :h)
      expect(card '4h').to  eq Card.new(4,  :h)
      expect(card '5h').to  eq Card.new(5,  :h)
      expect(card '6h').to  eq Card.new(6,  :h)
      expect(card '7h').to  eq Card.new(7,  :h)
      expect(card '8h').to  eq Card.new(8,  :h)
      expect(card '9h').to  eq Card.new(9,  :h)
      expect(card '10h').to eq Card.new(10, :h)
      expect(card 'jh').to  eq Card.new(11, :h)
      expect(card 'qh').to  eq Card.new(12, :h)
      expect(card 'kh').to  eq Card.new(13, :h)
    end

    it 'parses cards from ace to king of clubs' do
      expect(card '1c').to  eq Card.new(1,  :c)
      expect(card '2c').to  eq Card.new(2,  :c)
      expect(card '3c').to  eq Card.new(3,  :c)
      expect(card '4c').to  eq Card.new(4,  :c)
      expect(card '5c').to  eq Card.new(5,  :c)
      expect(card '6c').to  eq Card.new(6,  :c)
      expect(card '7c').to  eq Card.new(7,  :c)
      expect(card '8c').to  eq Card.new(8,  :c)
      expect(card '9c').to  eq Card.new(9,  :c)
      expect(card '10c').to eq Card.new(10, :c)
      expect(card 'jc').to  eq Card.new(11, :c)
      expect(card 'qc').to  eq Card.new(12, :c)
      expect(card 'kc').to  eq Card.new(13, :c)
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
      expect(card '1s').to  eq Card.new(1,  :s)
      expect(card '2s').to  eq Card.new(2,  :s)
      expect(card '3s').to  eq Card.new(3,  :s)
      expect(card '4s').to  eq Card.new(4,  :s)
      expect(card '5s').to  eq Card.new(5,  :s)
      expect(card '6s').to  eq Card.new(6,  :s)
      expect(card '7s').to  eq Card.new(7,  :s)
      expect(card '8s').to  eq Card.new(8,  :s)
      expect(card '9s').to  eq Card.new(9,  :s)
      expect(card '10s').to eq Card.new(10, :s)
      expect(card 'js').to  eq Card.new(11, :s)
      expect(card 'qs').to  eq Card.new(12, :s)
      expect(card 'ks').to  eq Card.new(13, :s)
    end
  end

  describe '#parse_hand' do
    it 'parses multiple cards separated by a space' do
      hand = Hand.new([
        Card.new(1, :s), Card.new(13, :s), Card.new(10, :d),
        Card.new(5, :c), Card.new(13, :h)
      ])

      expect(hand '1s ks 10d 5c kh').to eq hand
    end
  end
end
