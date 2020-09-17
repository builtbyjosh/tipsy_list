class CLI

    def main        
        fetch_beer_info
        greet_user
        #binding.pry
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
        API.new.fetch_data
    end    

    def say_goodbye
        puts "Cheers!"
    end

    def menu      
        puts "What would you like to know?"
        puts ""
        puts "Choose menu number:"
        puts "  1. To list all Breweries."
        puts "  2. To list all Beers."
        puts "  3. To see a beer list for a specific Brewery."
        puts "  4. To see more info on a specific Beer."
        puts ""
        puts "To quit, type 'exit'."

        input = gets.chomp

        case input
        when "1"
            list_breweries
        when "2"
            list_beers
        when "3"
            beers_at_brewery
        when "4"
            beer_info
        end

        unless input == "exit"
            menu
        end
        
    end

    def list_breweries
        Brewery.all.each {|b| puts "- #{b.name}" }        
    end

    def list_beers
        Beer.all.each {|b| puts "- #{b.name}"}
    end

    def beers_at_brewery
        puts "What Brewery would you like to display the beers for?"
        input = gets.chomp

        Beer.all.each do |b|
            puts b.name if b.brewery.name == input
        end
    end

    def beer_info
        puts "What Beer would you like more information on?"
        puts ""
        input = gets.chomp
        puts ""

        Beer.all.each do |b|
            if b.name == input
                puts "Name: #{b.name}"
                puts ""
                puts "Description: #{b.description}"
                puts ""
                puts "Style: #{b.style}"
                puts ""
                puts "Brewery: #{b.brewery}"
                puts ""
            end
        end

    end
end

