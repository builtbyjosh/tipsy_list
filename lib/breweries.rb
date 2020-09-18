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

end