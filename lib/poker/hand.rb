module Poker
  InvalidHandError = Class.new(StandardError)

  class Hand
    attr_reader :cards

    def initialize(cards)
      @cards = sort_cards_by_pips(cards)
      raise InvalidHandError, 'need 5 cards' if invalid?
    end

    def ==(other)
      other.is_a?(self.class) &&
        other.cards == cards
    end

    def to_s
      cards.map(&:to_s).join ' '
    end

    def inspect
      "#<Poker::Hand #{to_s}>"
    end

    private

    def invalid?
      cards.length != 5
    end

    def sort_cards_by_pips(cards)
      cards.sort_by(&:pips)
    end
  end
end
