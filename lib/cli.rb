class CLI

    def main        
        fetch_beer_info
        greet_user        
        menu        
        say_goodbye
        binding.pry
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
        puts "To see a beer list for a specific Brewery, type 'Beer List'"
        puts "To quit, type 'exit'."

        input = gets.chomp

        case input
        when "List Breweries"
            list_breweries
        when "List Beers"
            list_beers
        when "Beer List"
            beers_at_brewery
        end

        unless input == "exit"
            menu
        end
        
    end

    def list_breweries
        Brewery.all.each {|b| puts b.name}
    end

    def list_beers
        Beer.all.each {|b| puts b.name}
    end

    def beers_at_brewery
        puts "What Brewery would you like to display the beers for?"
        input = gets.chomp

        Beer.all.each_with_index do |b, i|
            puts "#{i+1}. #{b.name}" if b.brewery.name == input
        end
    

        # if brewery = Brewery.find_by_name(input)
        #     brewery.beers.each do |b|
        #         puts b.name
        #     end
        # end

    end
end

