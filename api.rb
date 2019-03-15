require 'csv'
require 'open-uri'
require 'json'

class Api
  def searcher(api_url)
    serialized_weather = open(api_url).read
    weather = JSON.parse(serialized_weather)
    weather
  end

end

