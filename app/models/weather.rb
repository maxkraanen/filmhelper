class Weather
  attr_reader :city, :current_weather, :sunset, :sunrise, :low_sun_correction, :background_video, :calculated_aperture, :exposure_time, :api_url, :local_time

  def initialize(attributes)
    @city = attributes[:city] || "Amsterdam"
    @film_speed = attributes[:film_speed].to_i
    @api_url = Api.new.searcher("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=9f540e1940bd34431a9801e570826e54")
    @current_weather = @api_url["weather"][0]["description"]

    Timezone::Lookup.config(:google) do |c|
      c.api_key = GOOGLE_KEY
    end

    @timezone = Timezone.lookup(@api_url["coord"]["lat"], @api_url["coord"]["lon"])
    @local_time = @timezone.utc_to_local(Time.now)

    start_services
    start_helpers
  end

  def start_services
    @sunset = SunsetService.new(sunset_timestamp: @api_url["sys"]["sunset"].to_s, timezone: @timezone).call
    @sunrise = SunriseService.new(sunrise_timestamp: @api_url["sys"]["sunrise"].to_s, timezone: @timezone).call
    @low_sun_correction = LowSunCorrectionService.new(timezone: @timezone, sunset_timestamp: @api_url["sys"]["sunset"].to_s, sunrise_timestamp: @api_url["sys"]["sunrise"].to_s).call
  end

  def start_helpers
    @calculated_aperture = ApertureHelper.new(current_weather: @current_weather, sunset: @sunset).call
    @exposure_time = ExposureTimeHelper.new(film_speed: @film_speed).call
    @background_video = BackgroundHelper.new(current_weather: @current_weather, sunset: @sunset, local_time: @local_time, sunrise: @sunrise).call
  end
end











