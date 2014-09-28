module Poker
  module Ranks
    class Rank
      def initialize(hand)
        @hand = hand
      end

      def matches?
        raise NotImplementedError
      end

      protected

      def cards
        hand.cards
      end

      def pairs_count
        same_pips_count(2)
      end

      def all_of_same_suit?
        grouped_by_suits.count == 1
      end

      def in_sequence?
        pips == [1, 10, 11, 12, 13] ||
          pips == (pips.first..pips.last).to_a
      end

      def same_pips_count(count)
        grouped_by_pips.values.count { |cards| cards.count == count }
      end

      private

      attr_reader :hand

      def grouped_by_pips
        cards.group_by(&:pips)
      end

      def grouped_by_suits
        cards.group_by(&:suit)
      end

      def pips
        cards.map(&:pips)
      end
    end
  end
end
