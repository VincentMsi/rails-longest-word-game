require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    # TODO: generate random grid of letters
    @letters = Array.new(12) { ('A'..'Z').to_a.sample }
    @nice_letters = @letters.each {|letter| puts "This #{letter}"}

    # end
  end

  def score
    @word = params[:word]
    @word_letter = @word.split(//)
    @letters = params[:letters]
    @failure = ""
    @word_letter.each do |letter|
      case
      when @letters.include?(letter.upcase) == false
        @failure = "Error! You cannot compute the word with the given letter #{letter}"
        end

        case
        when @failure == ""
          @result = "Your score is #{@word_letter.size.to_i}"
        when @failure == "Error! You cannot compute the word with the given letter #{letter}"
          @result = "Try again"
        end
      end

    url =  "https://wagon-dictionary.herokuapp.com/#{@word}"
    contents = open(url).read
    check = JSON.parse(contents)
    @error = "This word exists"

     if check["found"] == false
       @error = "This is not a real word"
 end
 if @error == "This is not a real word"
  @result = ""
end
      end
    end
  # end




