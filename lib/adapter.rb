https://sandbox-api.brewerydb.com/v2/


class API

    
    BREWERY_URL='https://sandbox-api.brewerydb.com/v2/breweries' 
    BEER_URL = 'https://sandbox-api.brewerydb.com/v2/brewery/'

    def fetch_breweries
        url = BREWERY_URL + '/?key=' + API_KEY 
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)

        data = JSON.parse(response.body)

    end
    def fetch_beers
        url = BEER_URL + brewery_id + "/beers" + '/?key=' + API_KEY
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)

        data = JSON.parse(response.body)

    end
end