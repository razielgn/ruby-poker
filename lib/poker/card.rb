require_relative 'card'

module Poker
  InvalidCardError = Class.new(StandardError)

  class Card
    SUITS = %i(c d h s)
    PIPS  = (1..13)

    attr_reader :pips
    attr_reader :suit

    def initialize(pips, suit)
      @pips = pips
      @suit = suit

      raise InvalidCardError unless valid?
    end

    def ==(other)
      other.is_a?(Card) &&
        other.pips == pips &&
        other.suit == suit
    end

    def inspect
      "#<Poker::Card #{to_s}>"
    end

    def to_s
      case pips
      when 1 then 'A'
      when 2..10 then pips.to_s
      when 11 then 'J'
      when 12 then 'Q'
      when 13 then 'K'
      end +
        PRETTY_SUITS.fetch(suit)
    end

    private

    PRETTY_SUITS = Hash[SUITS.zip(%w(♣ ♦ ♥ ♠))]

    def valid?
      SUITS.include?(suit) &&
        PIPS.include?(pips)
    end
  end
end
