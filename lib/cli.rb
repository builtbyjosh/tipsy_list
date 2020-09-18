class CLI
    @@beers = []
    @@breweries = []

    def main        
        fetch_beer_info
        greet_user
        #binding.pry
        list_breweries
        menu        
        say_goodbye
        
    end

    def greet_user
        puts "        Welcome to Tipsy List.          "
        puts "Your one stop spot for beer information!"
        puts ""
        puts "########################################"
        puts "#                                      #"
        puts "#                                      #"
        puts "#          .~~~~.       .~~~~.         #"
        puts "#         _i====i       i====i_        #"
        puts "#        (_|cccc|       |cccc|_)       #"
        puts "#          |cccc|       |cccc|         #"
        puts "#          `-==-'       `-==-'         #"
        puts "#                                      #"
        puts "#                                      #"
        puts "########################################"
        puts ""
    end

    def fetch_beer_info
        beers_hash = API.new.fetch_data_beer
        brewery_hash = API.new.fetch_data_brewery
        @@beers = beers_hash.map {|beers_hash| Beer.new(beers_hash)}
        @@breweries = brewery_hash.map {|brewery_hash| Brewery.new(brewery_hash)}        
    end    

    def say_goodbye
        puts "Cheers!"
    end

    def menu      
        puts "Choose menu number for more information:"
        puts "  1. Get more information on a specific Brewery?"        
        puts "  2. Show a beer list for a specific Brewery."
        puts "  3. See more info on a specific Beer."        
        puts "  4. Show the brewery list again."        
        puts "  5. See a list of all available beers."        
        puts ""
        puts "To quit, type 'exit'."
        puts ""

        input = gets.chomp

        
        if input == "1"
            brewery_info
        elsif input == "2"
            beers_at_brewery
        elsif input == "3"
            beer_info
        elsif input == "4"
            list_breweries
        elsif input == "5"
            list_all_beers
        elsif input == "exit"
            input = "exit"
        else
            puts "Invalid Choice, please try again."
        end

        unless input == "exit"
            menu
        end
        
    end

    def list_breweries
        puts "Here is list of available breweries."
        Brewery.all.each {|b| puts "    - #{b.name}" }
        puts ""
    end

    def list_beers(brewery_name)
        Beer.all.each {|b| puts "   - #{b.name}" if b.brewery == brewery_name}
        beer_info
    end

    def list_all_beers
        Beer.all.each {|b| puts "   - #{b.name}"}
        beer_info
    end

    def beers_at_brewery
        puts ""
        puts "What Brewery would you like to display the beers for?"
        input = gets.chomp

        Beer.all.each do |b|
            puts "  - #{b.name}" if b.brewery == input
        end
        beer_info        
    end

    def beer_info
        puts ""
        puts "What Beer would you like more information on?"
        puts ""
        input = gets.chomp
        puts ""

        Beer.all.select do |b|
            if b.name == input
                puts "Name:     #{b.name}"
                puts ""
                puts "ABV:      #{b.abv}"
                puts ""
                puts "Style:    #{b.style}"
                puts ""
                puts "Brewery:  #{b.brewery}"
                puts ""                
                puts "Description:"
                puts ""
                puts "          #{b.description}"
                puts ""            
            end

        end
    end

    def brewery_info
        puts ""
        puts "What Brewery would you like more information on?"
        puts ""
        input = gets.chomp
        puts ""

        Brewery.all.each do |b|
            if b.name == input
                puts "Name:        #{b.name}"
                puts ""
                puts "Website:     #{b.website}"
                puts ""
                puts "Established: #{b.established}"
                puts ""
                puts "Address:     #{b.street_address}"
                puts "             #{b.locality}, #{b.region} #{b.zip}"
            end
        end
        puts ""
        puts "Would you like to see the beer list for this brewery? (Y/N)"
        input2 = gets.chomp.downcase
        if input2 == "y"
            list_beers(input)
        else
            menu
        end
    end

end



