# Main file for 
def scrape 
  data = File.open('./flashcards.txt', 'r')
  def_hash = {}
  i = 1
  definition = []
  term = []
  data.each do |row|
    if (i-1) % 3 == 0
      definition << row.chomp
    elsif (i-2) % 3 == 0  
      term << row.chomp
    end
    i += 1
  end
  definition.length.times do |i|
    def_hash[term[i]] = definition  [i]
  end 
  def_hash
end
p scrape
