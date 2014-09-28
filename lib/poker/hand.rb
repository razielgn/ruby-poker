module Poker
  InvalidHandError = Class.new(StandardError)

  class Hand
    attr_reader :cards

    def initialize(cards)
      @cards = cards
      raise InvalidHandError, 'need 5 cards' if invalid?
    end

    def ==(other)
      other.is_a?(self.class) &&
        other.cards == cards
    end

    private

    def invalid?
      cards.length != 5
    end
  end
end
