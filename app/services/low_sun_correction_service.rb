class LowSunCorrectionService

  def initialize(attributes)
    @sunset_timestamp = attributes[:sunset_timestamp].to_i
    @sunrise_timestamp = attributes[:sunrise_timestamp].to_i
    @timezone = attributes[:timezone]
  end

  def call
   time_difference_from_sunset_sunrise
 end

 private

 def time_difference_from_sunset_sunrise

   @time_now = Time.now.to_i
   @sunrise_difference = @time_now - @sunrise_timestamp
   @sunset_difference =  @sunset_timestamp - @time_now

   if @sunset_difference > 0 && @sunset_difference < 5400
    "Add a stop, the sun is still low"
  else @sunset_difference > 0 &&  @sunset_difference < 5400
    "Add a stop, the sun is aboutb to set"
  end
end


end
