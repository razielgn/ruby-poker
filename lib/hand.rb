InvalidHandError = Class.new(StandardError)

class Hand
  def initialize(cards)
    @cards = cards
    raise InvalidHandError, 'need 5 cards' if invalid?
  end

  def ==(other)
    other.is_a?(self.class) &&
      other.cards == cards
  end

  def rank
    if one_pair?
      :one_pair
    else
      :high_card
    end
  end

  protected

  attr_reader :cards

  private

  def invalid?
    cards.length != 5
  end

  def one_pair?
    grouped_by_pips.values.one? { |cards|
      cards.count == 2
    }
  end

  def grouped_by_pips
    cards.group_by(&:pips)
  end
end
