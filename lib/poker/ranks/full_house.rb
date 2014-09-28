require_relative 'rank'

module Poker
  module Ranks
    class FullHouse < Rank
      def matches?
        ThreeOfAKind.new(cards).matches? &&
          OnePair.new(cards).matches?
      end
    end
  end
end
