require_relative 'rank'

module Poker
  module Ranks
    class ThreeOfAKind < Rank
      def matches?
        triples_count == 1
      end

      private

      def triples_count
        same_pips_count(3)
      end
    end
  end
end
