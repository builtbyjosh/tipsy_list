#https://sandbox-api.brewerydb.com/v2/


class API

    BEER_URL = 'https://sandbox-api.brewerydb.com/v2/beers/'

    def fetch_data_beer
        url = BEER_URL + '/?key=' + API_KEY + "&withBreweries=Y"
        uri = URI.parse(url)
        body = uri.read        
        brewery = JSON.parse(body)
        beers_hash = []
        brewery["data"].each do |e|             
            if e["style"]                
                beers_hash << {name: e["name"], abv: e["abv"], description: e["style"]["description"], style: e["style"]['shortName'], brewery: e["breweries"][0]["nameShortDisplay"]}                
            end
        end
        beers_hash
    end
    
    def fetch_data_brewery
        url = BEER_URL + '/?key=' + API_KEY + "&withBreweries=Y"
        uri = URI.parse(url)
        body = uri.read        
        brewery = JSON.parse(body)
        brewery_hash = []
        brewery["data"].each do |e|
            website = e["breweries"][0]["website"]                
            brewery_name = e["breweries"][0]["nameShortDisplay"]
            established = e["breweries"][0]["established"]
            street_address = e["breweries"][0]["locations"][0]["streetAddress"]
            locality = e["breweries"][0]["locations"][0]["locality"]
            region = e["breweries"][0]["locations"][0]["region"]
            zip = e["breweries"][0]["locations"][0]["postalCode"]

            brewery_hash << {name: brewery_name, website: website, established: established, street_address: street_address, locality: locality, region: region, zip: zip}
        end        
        brewery_hash.uniq
    end

end


# brewery["data"][0]["name"] = beers name
# brewery["data"][0]["style"]["shortName"] = style
# brewery["data"][0]["style"]["description"] = description
# brewery["data"][0]["breweries"][0]["names"] = brewery name


