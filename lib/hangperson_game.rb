class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  attr_accessor :word, :guesses, :wrong_guesses  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
     if letter == '' || letter =~ /[^a-zA-Z]/ || letter == nil
        raise ArgumentError, 'Argument Error'
     else
        if @word.upcase.include?(letter.upcase)
           if @guesses.upcase.include?(letter.upcase)
              return false
           else
              @guesses << letter
              return true
           end
        else
           if @wrong_guesses.upcase.include?(letter.upcase)
              return false
           else
              @wrong_guesses << letter
              return true
           end
        end 
     end  
  end

  def word_with_guesses
     display = ''
     @word.each_char { |c|
        if @guesses.include?(c) || @guesses.include?(c.upcase)
           display << c
        else
           display << "-"
        end
     }
     return display
  end

  def check_win_or_lose
     if @wrong_guesses.length == 7
        :lose
     elsif !self.word_with_guesses.include?("-")
        :win
     else
        :play
     end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
