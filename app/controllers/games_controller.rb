require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.shuffle[0..10]
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = URI.open(url).read
    @word = JSON.parse(word_serialized)
    if @word["found"]
      @answer = "Your word is #{params[:word].capitalize} and your score is #{@word['length']}"
     else
       @answer = 'Your word is not on the dictionnary, try again'
    end
  end
end
