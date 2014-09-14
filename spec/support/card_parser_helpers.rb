module CardParserHelpers
  def hand(string)
    CardParser.new.parse_hand(string)
  end

  def card(string)
    CardParser.new.parse_card(string)
  end
end
