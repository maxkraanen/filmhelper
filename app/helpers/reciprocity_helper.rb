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
    when "Kodak Tri-X 320/400"
      trix_reciprocity
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
     (@time * 1.4).round(1)
    elsif @time < 120
     (0.105*@time**2 + 2.007 * @time + 0.821).to_i
    else
     @time * 9
    end
  end

  def velvia_reciprocity
    case @time
    when  0..60
       @time
    when  61..180
       @time * 4/3
    when 181..300
       @time * 1.5
    when 301..600
       @time * 5/3
    else
       @time * 2
    end
  end

  def trix_reciprocity
    case @time
    when 1
      2
    when 2
      5
    when 3
      10
    when 4
      15
    when 5..9
      @time * 4.5
    when 10..14
      @time * 5
    when 15..19
      @time * 6.33
    when 20..29
      @time * 6.5
    when 30..39
      @time * 7
    when 40..59
      @time * 7.5
    when 60..89
      @time * 9
    when 90..179
      @time * 11.66
    when 180..599
      @time * 10
    when 600..899
      @time * 12
    when 900..1199
      @time * 13.33
    else
      @time * 12
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


