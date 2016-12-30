module Creatable
  module ClassMethods

    def create(name)
      instance = self.new(name)
      instance.save
    end

  end
  module InstanceMethods

    def save
      self.class.all << self
    end

  end
end
