class Brewery
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @beers = []
        @@all << self
    end

    def self.all
        @@all
    end
    
end