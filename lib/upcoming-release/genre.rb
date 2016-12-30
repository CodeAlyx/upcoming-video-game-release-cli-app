class Genre
  include Creatable::InstanceMethods
  extend Findable::ClassMethods
  extend Creatable::ClassMethods
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
