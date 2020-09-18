class Beer
    attr_accessor :name, :description, :brewery, :style, :abv

    @@all = []

    def initialize(name:, abv:, description:, style:, brewery:)
        @name = name
        @abv = abv
        @description = description
        @brewery = brewery
        @style = style
        @@all << self
    end

    def self.all
        @@all
    end
    
end