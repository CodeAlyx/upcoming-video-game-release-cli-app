class Game
  attr_accessor :name, :release_date, :genre, :console
  @@all = []

  def initialize(name)
    self.name = name
  end

  def save
    Game.all << self
  end

  def create_or_update_by_hash(hash)
    #creates new game via hash data
    #if game already exists, updates with any new information
  end

  def self.all
    @@all
  end

end
