class Style
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
    
end