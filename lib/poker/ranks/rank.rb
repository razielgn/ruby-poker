module Poker
  module Ranks
    class Rank
      def initialize(cards)
        @cards = cards
      end

      def matches?
        raise NotImplementedError
      end

      protected

      attr_reader :cards

      def pairs_count
        same_pips_count(2)
      end

      def all_of_same_suit?
        grouped_by_suits.count == 1
      end

      def in_sequence?
        pips = sorted_by_pips.map(&:pips)
        pips == [1, 10, 11, 12, 13] ||
          pips == (pips.first..pips.last).to_a
      end

      def same_pips_count(count)
        grouped_by_pips.values.count { |cards| cards.count == count }
      end

      private

      def sorted_by_pips
        cards.sort_by(&:pips)
      end

      def grouped_by_pips
        cards.group_by(&:pips)
      end

      def grouped_by_suits
        cards.group_by(&:suit)
      end
    end
  end
end
