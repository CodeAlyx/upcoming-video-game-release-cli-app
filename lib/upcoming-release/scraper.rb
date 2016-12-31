require 'nokogiri'
require 'open-uri'

class Scraper

  def self.get_page
    doc = Nokogiri::HTML(open("http://www.ign.com/games/upcoming?"))
  end

  def self.get_games
    get_page.css("div.itemList-item")
  end

  def self.create_game_hash(game)
    console = Console.find_or_create_by_name(game.css("span.item-platform").text)
    genres = []
    game.css("span.item-genre").text.split(",").each do |genre|
      genres << Genre.find_or_create_by_name(genre.strip)
    end
    hash = {
      name: game.css("div.item-title a").text.strip,
      release_date: game.css("div.releaseDate").text.strip,
      console: console,
      genre: genres
    }
  end

  def self.create_games_with_hash
    get_games.each do |game|
      Game.create_or_update_by_hash(create_game_hash(game))
    end
  end

end
