#https://sandbox-api.brewerydb.com/v2/


class API

    
    #BREWERY_URL='https://sandbox-api.brewerydb.com/v2/breweries' 
    BEER_URL = 'https://sandbox-api.brewerydb.com/v2/beers/'

    def fetch_data
        url = BEER_URL + '/?key=' + API_KEY + "&withBreweries=Y"
        uri = URI.parse(url)
        body = uri.read        
        brewery = JSON.parse(body)
        brewery["data"].each do |e|
            #temp_brew = Brewery.new(e["breweries"][0]["names"], e["breweries"][0]["website"])
            if e["style"]
                name = e["name"]
                description =  e["style"]["description"] || nil
                style = e["style"]['shortName'] || nil
                brewery = e["breweries"][0]["name"]
                Beer.new(name, description, style, brewery)
            #binding.pry  
            end
        end       
    end
end


# brewery["data"][0]["name"] = beers name
# brewery["data"][0]["style"]["shortName"] = style
# brewery["data"][0]["style"]["description"] = description
# brewery["data"][0]["breweries"][0]["names"] = brewery name
# brewery["data"][0]["breweries"][0]["website"] = brewery website

