class ApertureHelper
  def initialize(attributes)
    @weather_for_aperture = attributes[:current_weather]
  end

  def call
    weather_to_aperture
  end

  private

  def weather_to_aperture
      if @weather_for_aperture == "clear sky"
        "Aperture F16"
      elsif @weather_for_aperture == "few clouds"
        "Aperture F11"
      elsif @weather_for_aperture == "scattered clouds" || "broken clouds" || "haze"
        "Aperture F8"
      elsif @weather_for_aperture == "shower rain" || "rain" || "snow" || "mist" || "thunderstorm" || "heavy intensity rain"
        "Aperture F5.6"
      else
       "I have no idea"
    end
  end
end








