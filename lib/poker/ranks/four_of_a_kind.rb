require_relative 'rank'

module Poker
  module Ranks
    class FourOfAKind < Rank
      def matches?
        fourths_count == 1
      end

      private

      def fourths_count
        same_pips_count(4)
      end
    end
  end
end
