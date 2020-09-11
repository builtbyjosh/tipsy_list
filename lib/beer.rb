class Beer
    attr_accessor :name, :description, :brewery, :style

    @@all = []

    def initialize(name, description, brewery, style)
        @name = name
        @description = description
        @brewery = brewery
        @style = style
        @@all << self
    end

    def self.all
        @@all
    end
    
end