class SunriseService
  def initialize(attributes)
    @sunrise_timestamp = attributes[:sunrise_timestamp]
    @timezone = attributes[:timezone]
  end

  def call
    convert_to_datetime

  end

  private

  def convert_to_datetime
    @sunrise_timestamp = DateTime.strptime(@sunrise_timestamp,'%s')
    # set_datetime_display_option

    # @sunrise_timestamp = @sunrise_timestamp.to_time
    @timezone.utc_to_local(@sunrise_timestamp)
  end

  def set_datetime_display_option
    @sunrise_timestamp.strftime("%H:%M")
  end

end

