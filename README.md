# ColorGradient

[![Gem Version](https://badge.fury.io/rb/color_gradient.svg)](https://rubygems.org/gems/color_gradient)
[![Build Status](https://semaphoreci.com/api/v1/limeblast/color_gradient/branches/master/shields_badge.svg)](https://semaphoreci.com/limeblast/color_gradient)
[![Code Climate](https://codeclimate.com/github/LimeBlast/color_gradient/badges/gpa.svg)](https://codeclimate.com/github/LimeBlast/color_gradient)
[![Test Coverage](https://codeclimate.com/github/LimeBlast/color_gradient/badges/coverage.svg)](https://codeclimate.com/github/LimeBlast/color_gradient/coverage)
[![Issue Count](https://codeclimate.com/github/LimeBlast/color_gradient/badges/issue_count.svg)](https://codeclimate.com/github/LimeBlast/color_gradient)
[![Dependency Status](https://gemnasium.com/badges/github.com/LimeBlast/color_gradient.svg)](https://gemnasium.com/github.com/LimeBlast/color_gradient)

This, my first ever gem, takes a [gradient calculation class](http://tnux.net/blog/2011/10/26/gradient-calculation-in-ruby/) created by [Tom Pesman](http://tnux.net/), and makes it use [Color gem](https://github.com/halostatue/color) objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'color_gradient'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install color_gradient

## Usage

```ruby
start = Color::RGB.new(0, 0, 0)
stop = Color::RGB.new(255, 255, 255)
resolution = 7

color_gradient = ColorGradient.new(start, stop, resolution)

# Each of the following returns a Color gem object for the colour relating to that step
color_gradient.gradient(0)
color_gradient.gradient(1)
color_gradient.gradient(2)
color_gradient.gradient(3)
color_gradient.gradient(4)
color_gradient.gradient(5)
color_gradient.gradient(6)
color_gradient.gradient(7)
```

## Todo

- Make the `ColorGradient` object enumerable to make it loopable.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LimeBlast/color_gradient.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
