class Beer
    attr_accessor :name, :description, :brewery, :style

    @@all = []

    def initialize(name, description, style , brewery)
        @name = name
        @description = description
        self.brewery=(brewery)
        #self.style=(style) 
        @style = style
        @@all << self
    end

    def self.all
        @@all
    end

    def brewery=(brewery)
        @brewery = brewery
        brewery.add_beer(self)
    end

    # def style=(style)
    #     @style = style
    #     unless style.beers.include?(self)
    #         style.beers << self
    #     end
    # end
    
end