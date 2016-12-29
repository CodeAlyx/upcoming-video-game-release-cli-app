class Console
  attr_accessor :name, :games
  @@all

  def initialize(name)
    self.name = name
    self.games = []
  end

  def self.all
    @@all
  end

end
