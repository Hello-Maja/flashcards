require_relative 'flashcards.rb'

class Deck
  attr_reader :deck

  def initialize(hash)
    @hash = hash
    @deck = []
  end

  def create_deck
    @hash.each do |term, definition|
      card = Card.new(term,definition)
      @deck << card
    end
    @deck
  end

end

class Card
  attr_reader :term, :definition 

  def initialize(term, definition)
    @term = term
    @definition = definition
  end

end

deck = Deck.new(scrape)
p deck.create_deck

