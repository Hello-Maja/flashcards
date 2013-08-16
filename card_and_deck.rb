require_relative 'flashcards.rb'
require 'debugger'

class Deck
  attr_reader :deck

  def initialize(hash)
    @deck = []
    create_deck(hash)
  end

  def create_deck(args)
    args.each do |term, definition|
      card = Card.new(term,definition)
      @deck << card
    end
    @deck.shuffle!
  end

  def get_card(card_x)
    @deck[card_x]
  end

  def num_cards
    @deck.count
  end
end

class Card
  attr_reader :term, :definition 

  def initialize(term, definition)
    @term = term
    @definition = definition
  end
end

class Controller
  attr_reader :deck, :card_no, :curr_card

  def initialize
    @deck = Deck.new(scrape)
    @view = View.new
    @card_no = 0
    @total_cards = @deck.num_cards
    run
  end

  def run
    @curr_card = produce_card
    @view.display_card_section(curr_card.definition)
    @response = get_response
    correct = check_response?(@response)
    guess_reaction(correct)
  end

  def guess_reaction(tf)
    if tf
      @view.display_correct(@curr_card.term)
      next_card
    elsif @response == "q"
      @view.display_goodbye 
      return 
    else 
      @view.display_guess_again
      guess_again = gets.chomp.downcase
      guess_again_method(guess_again)
    end
  end

  def guess_again_method(yn)
    if yn == "no"
      @view.display_new_flashcard_response
      next_card
    else 
      run
    end
  end

  def produce_card
    deck.get_card(card_no)
  end

  def card_counter
    @card_no += 1
  end

  def get_response
    puts "#{@curr_card.term}"
    @view.display_quit_option
    response = gets.chomp
  end
  
  def next_card
    card_counter
    run
  end
  
  def check_response?(guess)
    guess == @curr_card.term
  end
end

class View
  def display_card_section(section)
    puts section
  end

  def display_correct(term)
    puts "#{term} is correct!"
  end

  def display_quit_option
    print "Guess (q to quit): "
  end

  def display_new_flashcard_response
    puts 
    puts "Ok - new flashcard:"
  end  

  def display_guess_again
    puts "Would you like to guess again?  Enter yes or no."
  end

  def display_goodbye
    puts "Thanks for using these Flashcards!"
  end
end

session = Controller.new


