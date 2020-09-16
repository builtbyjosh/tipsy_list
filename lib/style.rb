class Style
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
        Beer.all.select {|b| b.style == self}
    end
    
end