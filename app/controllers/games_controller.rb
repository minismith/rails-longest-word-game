require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    @letters
  end

  def score
    @word = params['word']
    @letters = params['letters']
    @letter_array = @letters.split('')
    @word_array = @word.upcase.split('')
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = URI.open(url).read
    @dictionary_word = JSON.parse(word_serialized)
    @current_score = @word.length
    session[:total_score] += @current_score
  end
end
