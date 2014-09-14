InvalidCardError = Class.new(StandardError)

class Card
  SUITS = %i(c d h s)
  PIPS  = (1..13)

  attr_reader :pips
  attr_reader :suit

  def initialize(pips, suit)
    @pips = pips
    @suit = suit

    raise InvalidCardError unless valid?
  end

  def ==(other)
    other.is_a?(Card) &&
      other.pips == pips &&
      other.suit == suit
  end

  private

  def valid?
    SUITS.include?(suit) &&
      PIPS.include?(pips)
  end
end
