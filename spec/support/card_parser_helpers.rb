require 'poker/card_parser'

module CardParserHelpers
  def hand(string)
    Poker::CardParser.new.parse_hand(string)
  end

  def card(string)
    Poker::CardParser.new.parse_card(string)
  end
end
