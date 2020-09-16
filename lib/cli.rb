class CLI

    def main        
        fetch_beer_info
        greet_user        
        menu        
        say_goodbye
        #binding.pry
    end

    def greet_user
        puts "        Welcome to Tipsy List.          "
        puts "Your one stop spot for beer information!"
    end

    def fetch_beer_info
        API.new.fetch_data
    end    

    def say_goodbye
        puts "Cheers!"
    end

    def menu      
                 
        puts "To list all Breweries, type 'List Breweries'."
        puts "To list all Beers, type 'List Beers'."
        puts "To quit, type 'exit'."

        input = gets.chomp

        case input
        when "List Breweries"
            list_breweries
        when "List Beers"
            list_beers
        end

        unless input == "exit"
            menu
        end
        
    end

    def list_breweries
        Brewery.all.each do |b|
            puts b.name
        end
    end

    def list_beers
        Beer.all.each do |b|
            puts b.name
            #puts b.brewery
            #puts b.style
        end
    end

end