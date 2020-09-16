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

    def beers
        @beers
    end

    def add_beer(beer)
        #beer.brewery = self
        unless self.beers.include?(beer)
            self.beers << beer
        end
    end

    
    
end