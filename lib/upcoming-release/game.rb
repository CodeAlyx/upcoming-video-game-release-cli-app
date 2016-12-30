class Game
  include Creatable::InstanceMethods
  extend Findable::ClassMethods
  extend Creatable::ClassMethods
  attr_accessor :name, :release_date, :genre, :console
  @@all = []

  def initialize
    self.name = name
    self.console = []
  end

  def save
    Game.all << self
  end

  def self.create_or_update_by_hash(hash)
    #creates new game via hash data
    #if game already exists, updates with any new information
    if self.all.include?(hash[:name])
      included = self.find_by_name(hash[:name])
      included.console << hash[:console] if !included.console.include?(hash[:console])
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

end
