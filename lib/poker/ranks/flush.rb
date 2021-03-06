require_relative 'rank'

module Poker
  module Ranks
    class Flush < Rank
      def matches?
        all_of_same_suit? && !in_sequence?
      end
    end
  end
end
