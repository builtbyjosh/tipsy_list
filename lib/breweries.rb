class Brewery
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def beers
        Beer.all.select {|b| b.brewery == self}
    end

    # def add_beer(beer)
    #     beer.brewery = self
    #     unless self.beers.include?(beer)
    #         self.beers << beer
    #     end
    # end

    def self.find_by_name(name)
        @@all.collect {|b| b.name == name}
    end
    
    
end