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

# google_api_key = AIzaSyCxr4Ol5qHxmBWdf_mx0vT5g8MkFI1Tjkk


# 9f540e1940bd34431a9801e570826e54

# api.openweathermap.org/data/2.5/forecast?id=524901&APPID=9f540e1940bd34431a9801e570826e54

