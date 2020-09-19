class Brewery
    attr_accessor :name, :website, :established, :street_address, :region, :locality, :zip

    @@all = []

    def initialize(name:, website:, established:, street_address:, locality:, region:, zip:)
        @name = name
        @website = website
        @established = established
        @street_address = street_address
        @locality = locality
        @region = region
        @zip = zip
        @@all << self
    end

    def self.all
        @@all
    end

    def self.brewery_list
        @@all.each {|b| puts "    - #{b.name}".colorize(:blue) }
    end    

    def self.brewery_spec(input)
        info = Brewery.all.find {|b| b.name == input}            
        puts "Name:".colorize(:light_blue).underline + "        #{info.name}"
        puts ""
        puts "Website:".colorize(:light_blue).underline + "     #{info.website}"
        puts ""
        puts "Established:".colorize(:light_blue).underline + " #{info.established}"
        puts ""
        puts "Address:".colorize(:light_blue).underline + "     #{info.street_address}"
        puts "             #{info.locality}, #{info.region} #{info.zip}"        
    end

end