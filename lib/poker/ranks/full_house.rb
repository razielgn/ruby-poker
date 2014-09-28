require_relative 'rank'

module Poker
  module Ranks
    class FullHouse < Rank
      def matches?
        ThreeOfAKind.new(hand).matches? &&
          OnePair.new(hand).matches?
      end
    end
  end
end
