class HangpersonGame
   attr_accessor :word, :guesses, :wrong_guesses
   def initialize(new_word)
      @word = new_word
      @guesses = ''
      @wrong_guesses = ''
   end
end

