require 'nokogiri'
require 'open-uri'
require './game.rb'

class Scraper

  def self.get_page
    doc = Nokogiri::HTML(open("http://www.ign.com/games/upcoming?"))
  end

  def self.get_games
    self.get_page.css("")
  end

  def self.create_game_hash(game)

  end

  def self.create_games_with_hash
    self.get_games.each do |game|
      Game.create_or_update_by_hash << self.create_game_hash(game)
    end
  end

end
