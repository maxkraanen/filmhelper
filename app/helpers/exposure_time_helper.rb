class ExposureTimeHelper

  def initialize(attributes)
    @filmspeed = attributes[:film_speed].to_i
  end

  def call
    filmspeed_to_exposure_time
  end


  private

  def filmspeed_to_exposure_time
    case @filmspeed
    when 0..1
      "1 second"
    when 1.1..2
      "1/2"
    when 3..6
      "1/4"
    when 7..14
      "1/8"
    when 15..24
      "1/16"
    when 25..48
      "1/32"
    when 49..100
      "1/64"
    when 101..180
      "1/125"
    when 181..350
      "1/250"
    when 351..750
      "1/500"
    when 751..1500
      "1/1000"
    when 1501..2500
      "1/2000"
    when 2501..4000
      "1/4000"
    else
      "I don't know this type of film"
    end
  end
end

