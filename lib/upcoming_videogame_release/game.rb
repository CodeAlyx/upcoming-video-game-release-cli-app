class UpcomingVideogameRelease::Game
  include Creatable::InstanceMethods
  extend Findable::ClassMethods
  extend Creatable::ClassMethods
  attr_accessor :name, :release_date, :genre, :console
  @@all = []

  def initialize(name)
    self.name = name
    self.console = []
    self.genre = []
  end

  def display
    puts "Title: #{self.name}"
    print "Console(s): "
    self.console.each do |console|
      print "#{console.name} "
    end
    puts "\nRelease Date: #{self.release_date}"
    print "Genre: "
    self.genre.each do |genre|
      print "#{genre.name} "
    end
    puts ""
  end

  def save
    UpcomingVideogameRelease::Game.all << self
  end

  def self.create_or_update_by_hash(hash)
    #creates new game via hash data
    #if game already exists, updates with any new information
    if self.find_by_name(hash[:name]) != nil
      self.find_by_name(hash[:name]).console << hash[:console] if !self.find_by_name(hash[:name]).console.include?(hash[:console])
    else
      newGame = self.create(hash[:name])
      newGame.release_date = hash[:release_date]
      newGame.genre = hash[:genre]
      newGame.console << hash[:console]
    end
  end

  def self.all
    @@all
  end

  def self.display_all(collection = self.all)
    collection.each do |game|
      game.display
      puts "\n*********************\n"
    end
    nil
  end

  def self.collect_by_genre(genre)
    collection = []
    self.all.each do |game|
      flag = false
      game.genre.each do |game_genre|
        flag = true if game_genre.name.downcase == genre
      end
      collection << game if flag
    end
    collection
  end

  def self.collect_by_console(console)
    collection = []
    self.all.each do |game|
      flag = false
      game.console.each do |game_console|
        flag = true if game_console.name.downcase == console
      end
      collection << game if flag
    end
    collection
  end

end
