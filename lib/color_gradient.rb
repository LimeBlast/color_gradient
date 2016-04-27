require "color_gradient/version"

class ColorGradient
  def initialize(start, stop, resolution)
    raise ArgumentError, 'start Argument is not Color gem object' unless start.is_a? Color
    raise ArgumentError, 'stop Argument is not Color gem object' unless stop.is_a? Color
    raise ArgumentError, 'resolution Argument is not integer' unless resolution.is_a? Integer

    @start        = start
    @stop         = stop
    @resolution   = Float(resolution)
    @result_array = []

    (resolution+1).times do |i|
      @result_array << generate_step(i)
    end
  end

  def gradient(step)
    result_array[step]
  end

  private

  attr_accessor :start, :stop, :resolution, :result_array

  def generate_step(step)
    r = interpolate(start.red.to_i, stop.red.to_i, step)
    g = interpolate(start.green.to_i, stop.green.to_i, step)
    b = interpolate(start.blue.to_i, stop.blue.to_i, step)
    Color::RGB.new(r, g, b)
  end

  def interpolate(start, stop, step)
    if start < stop
      (((stop - start) * (step / resolution)) + start).round
    else
      (((start - stop) * (1 - (step / resolution))) + stop).round
    end
  end
end
