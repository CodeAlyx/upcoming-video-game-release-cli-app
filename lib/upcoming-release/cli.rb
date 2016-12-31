
require_all 'lib'

class CLI

  def self.start
    Scraper.create_games_with_hash

    puts "Would you like to view upcoming video game releases?"
    choice = gets.strip.downcase
    if choice.include?("y")
      begin
        puts "How would you like to view upcoming video game releases?"
        puts "All | By Title: \"Title\" | By Genre: \"Genre\" | By Console: \"Console\""
        choice = gets.strip.downcase
        case choice
        when "all"
          puts "\n"
          Game.display_all
        when "by title:#{choice.split(":")[1]}"
          puts "\n"
          title = choice.split(":")[1].strip!
          Game.find_by_name(title).display
        when "by genre:#{choice.split(":")[1]}"
          puts "\n"
          title = choice.split(":")[1].strip!
          Game.display_all(Game.collect_by_genre(title))
        when "by console:#{choice.split(":")[1]}"
          puts "\n"
          title = choice.split(":")[1].strip!
          Game.display_all(Game.collect_by_console(title))
        else
          puts choice
          puts "by genre:#{choice.split(":")[1]}"
          puts "That is not a valid option."
          choice = "invalid"
        end
      end until choice != "invalid"

    else
      puts "Game well, my friend."
    end
  end

end
