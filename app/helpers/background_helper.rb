class BackgroundHelper

  def initialize(attributes)
    @background_video = attributes[:current_weather]
    @sunset = attributes[:sunset]
    @sunrise = attributes[:sunrise]
    @local_time = attributes[:local_time]
  end

  def call
    weather_to_background_video
  end

  private

  def weather_to_background_video
    # before sunset
      if @sunset.to_time >= @local_time && @local_time >= @sunrise.to_time
      case @background_video
      when "clear sky"
        "sun.mp4"
      when "few clouds"
        "fewclouds.mp4"
      when "scattered clouds", "broken clouds"
        "heavyclouds.mp4"
      when "light intensity shower rain", "heavy intensity shower rain"
       "rain.mp4"
      when "mist", "haze"
       "fog.mp4"
      when "snow"
        "snow.mp4"
      when "thunderstorm"
        "thunderstorm.mp4"
      else
        "I have no idea"
    end
      else
      # after sunset
        "night.mp4"
    end
  end
end


