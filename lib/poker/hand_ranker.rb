require_relative 'ranks'

module Poker
  class HandRanker
    def initialize(hand)
      @cards = hand.cards
    end

    def rank
      if straight_flush?
        Ranks::StraightFlush.new
      elsif four_of_a_kind?
        Ranks::FourOfAKind.new
      elsif full_house?
        Ranks::FullHouse.new
      elsif straight?
        Ranks::Straight.new
      elsif flush?
        Ranks::Flush.new
      elsif three_of_a_kind?
        Ranks::ThreeOfAKind.new
      elsif two_pairs?
        Ranks::TwoPairs.new
      elsif one_pair?
        Ranks::OnePair.new
      else
        Ranks::HighCard.new
      end
    end

    private

    attr_reader :cards

    def one_pair?
      pairs_count == 1
    end

    def two_pairs?
      pairs_count == 2
    end

    def three_of_a_kind?
      triples_count == 1
    end

    def straight?
      in_sequence? && !one_suit?
    end

    def flush?
      one_suit? && !in_sequence?
    end

    def full_house?
      three_of_a_kind? && one_pair?
    end

    def four_of_a_kind?
      fourths_count == 1
    end

    def straight_flush?
      one_suit? && in_sequence?
    end

    def grouped_by_pips
      cards.group_by(&:pips)
    end

    def grouped_by_suits
      cards.group_by(&:suit)
    end

    def sorted_by_pips
      cards.sort_by(&:pips)
    end

    def pairs_count
      same_pips_count(2)
    end

    def triples_count
      same_pips_count(3)
    end

    def fourths_count
      same_pips_count(4)
    end

    def one_suit?
      grouped_by_suits.count == 1
    end

    def in_sequence?
      pips = sorted_by_pips.map(&:pips)
      pips == [1, 10, 11, 12, 13] ||
        pips == (pips.first..pips.last).to_a
    end

    def same_pips_count(count)
      grouped_by_pips.values.count { |cards|
        cards.count == count
      }
    end
  end
end
