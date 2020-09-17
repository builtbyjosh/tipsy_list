class Brewery
    attr_accessor :name, :website

    @@all = []

    def initialize(name, website)
        @name = name
        @website = website
        @@all << self
    end

    def self.all
        @@all
    end

    def beers
        Beer.all.select {|b| b.brewery == self}
    end   
end