class Deck

      attr_reader :deck

  def initialize(cards)
    @cards = cards
    @deck = []
  end

  def create_deck
    @cards.each do |term, definition|
      card = Card.new(term,definition)
      deck << card
  end

  end
end

class Card

  attr_reader :term, :definition 

  def initialize(term,definition)
    @term = term
    @definition = definition
  end

end
