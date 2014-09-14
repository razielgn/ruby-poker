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
    :high_card
  end

  protected

  attr_reader :cards

  private

  def invalid?
    cards.length != 5
  end
end
