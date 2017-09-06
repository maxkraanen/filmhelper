class Reciprocity

  attr_reader :time, :filmtype, :reciprocity_correction

  def initialize(attributes)
    @filmtype = attributes[:filmtype]
    @time = attributes[:time]
    @reciprocity_correction = ReciprocityHelper.new(filmtype: @filmtype, time: @time).call

  end

end
