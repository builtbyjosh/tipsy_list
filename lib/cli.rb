class CLI

    def main
        greet_user
        fetch_beer_info
        #prompt_for_beers
        # depending on what the user selects, do more stuff afterward (like show them details about recipe)
        # this is where lots of CLI looping and logic will happen
        #list_breweries
        binding.pry
        #say_goodbye
        
    end

    def greet_user
        puts "welcome to Tipsy List."
        puts "Your one stop spot for beer information!"
    end

    def fetch_beer_info
        API.new.fetch_data
    end

    # def prompt_for_beers


    # end


    def say_goodbye
        "Cheers!"
    end

    def list_breweries
        Brewery.all.name
    end

    # def list_beers
    #     Beer.all.each do |b|
    #         puts b.name
    #         puts b.description
    #         puts b.brewery
    #         puts b.style
    #     end
    # end

end