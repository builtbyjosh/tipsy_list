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
    
    def self.brewery_beer(input)
        @@all.each {|b| puts "   - #{b.name}".colorize(:blue) if b.brewery == input}
    end

    def self.list_all_beers
        Beer.all.each {|b| puts "   - #{b.name}".colorize(:blue)}
    end

    def self.beer_spec(input) 
        info = Beer.all.find {|b| b.name == input}        
        puts "Name:".colorize(:light_blue).underline + "     #{info.name}"
        puts ""
        puts "ABV:".colorize(:light_blue).underline + "      #{info.abv}"
        puts ""
        puts "Style:".colorize(:light_blue).underline + "    #{info.style}"
        puts ""
        puts "Brewery:".colorize(:light_blue).underline + "  #{info.brewery}"
        puts ""                
        puts "Description:".colorize(:light_blue).underline
        puts ""
        puts "          #{info.description}"
        puts ""
    end
end