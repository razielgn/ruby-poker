require 'card'

InvalidCardError = Class.new(StandardError)

class CardParser
  FORMAT = /(\d+|[jqk])([hcds])/
  FIGURES_MAPPING = { 'j' => 11, 'q' => 12, 'k' => 13 }

  def parse_card(string)
    pips, suit = match_against_regexp(string)
    pips = number_or_figure_to_number(pips)

    raise InvalidCardError if invalid_card?(pips, suit)

    Card.new(pips, suit.to_sym)
  end

  private

  def invalid_card?(pips, suit)
    suit.nil? || !(1..13).include?(pips)
  end

  def match_against_regexp(string)
    string.match(FORMAT).to_a.drop(1)
  end

  def number_or_figure_to_number(pips)
    FIGURES_MAPPING.fetch(pips, pips.to_i)
  end
end
