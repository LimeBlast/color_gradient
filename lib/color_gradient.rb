require 'color_gradient/version'
require 'forwardable'

class ColorGradient
  include Enumerable
  extend Forwardable

  def_delegators :colours, :each, :last, :[]

  def initialize(start, stop, resolution)
    raise ArgumentError, 'start Argument is not Color gem object' unless start.is_a? Color
    raise ArgumentError, 'stop Argument is not Color gem object' unless stop.is_a? Color
    raise ArgumentError, 'resolution Argument is not integer' unless resolution.is_a? Integer

    @start      = start.freeze
    @stop       = stop.freeze
    @resolution = Float(resolution).freeze
    @colours    = generate_colours.freeze
  end

  def gradient(step)
    colours[step]
  end

  private

  attr_reader :start, :stop, :resolution, :colours

  def generate_colours
    (0..resolution).map { |i| generate_step(i) }
  end

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
