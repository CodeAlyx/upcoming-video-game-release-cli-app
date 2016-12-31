class UpcomingVideogameRelease::Console
  include Creatable::InstanceMethods
  extend Findable::ClassMethods
  extend Creatable::ClassMethods
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
  end

  def self.all
    @@all
  end

end
