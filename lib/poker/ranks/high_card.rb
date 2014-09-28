require_relative 'rank'

module Poker
  module Ranks
    class HighCard < Rank
      def matches?
        true
      end
    end
  end
end
