require_relative 'ranks'

module Poker
  class HandRanker
    def initialize(hand)
      @hand = hand
    end

    def rank
      RANKS.lazy \
        .map { |klass| klass.new(hand) }
        .find(&:matches?)
    end

    private

    # Order matters.
    RANKS = [
      Ranks::StraightFlush,
      Ranks::FourOfAKind,
      Ranks::FullHouse,
      Ranks::Straight,
      Ranks::Flush,
      Ranks::ThreeOfAKind,
      Ranks::TwoPairs,
      Ranks::OnePair,
      Ranks::HighCard,
    ]

    attr_reader :hand
  end
end
