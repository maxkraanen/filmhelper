class ReciprocityHelper

  def initialize(attributes)
    @filmtype = attributes[:filmtype]
    @time = attributes[:time]
  end

  def call
    case @filmtype
    when "Kodak Portra 160/400"
      portra_reciprocity
    when "Ilford HP5+/FP4+/Delta400/3200"
      hp5_reciprocity
    when "Fuji Velvia 100"
      velvia_reciprocity
    end
  end

  private

  def portra_reciprocity
    if @time < 2
      @reciprocity_correction = @time * 1.1
    else
      @reciprocity_correction = (0.5167 * Math.log(@time) - 0.2)
      stops_to_time_correction
    end
  end

  def hp5_reciprocity
    if @time < 5
      @reciprocity_correction = (@time * 1.4).round(1)
    elsif @time < 120
      @reciprocity_correction = (0.105*@time**2 + 2.007 * @time + 0.821).to_i
    else
      @reciprocity_correction = @time * 9
    end
  end

  def velvia_reciprocity
    case @time
    when  0..60
      @reciprocity_correction = @time
    when  61..180
      @reciprocity_correction = @time * 4/3
    when 181..300
      @reciprocity_correction = @time * 1.5
    when 301..600
      @reciprocity_correction = @time * 5/3
    else
      @reciprocity_correction = @time * 2
    end
  end

  def stops_to_time_correction
    if @reciprocity_correction < 1
    @reciprocity_correction = ((1 + @reciprocity_correction) * @time).round(1)

    else
      @reciprocity_correction = @reciprocity_correction.to_s.split(".")
      @time = (2**(@reciprocity_correction[0].to_i)) * @time
      @reciprocity_correction = (@time + @time * ["0.", @reciprocity_correction[1]].join.to_f).to_i
    end
  end
end


