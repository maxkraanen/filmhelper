class SunsetService
  def initialize(attributes)
    @sunset_timestamp = attributes[:sunset_timestamp]
    @timezone = attributes[:timezone]
  end

  def call
    convert_to_datetime

  end

  private

  def convert_to_datetime
    @sunset_timestamp = DateTime.strptime(@sunset_timestamp,'%s')

    @timezone.utc_to_local(@sunset_timestamp)
  end

  # def set_datetime_display_option
  #   @sunset_timestamp.strftime("%H:%M")
  # end

end


