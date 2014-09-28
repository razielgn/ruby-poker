require_relative 'rank'

module Poker
  module Ranks
    class TwoPairs < Rank
      def matches?
        pairs_count == 2
      end
    end
  end
end
