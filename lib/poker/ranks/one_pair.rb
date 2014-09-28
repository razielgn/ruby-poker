require_relative 'rank'

module Poker
  module Ranks
    class OnePair < Rank
      def matches?
        pairs_count == 1
      end
    end
  end
end
