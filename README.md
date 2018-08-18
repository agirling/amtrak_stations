# Amtrak

[![Gem Version](https://badge.fury.io/rb/amtrak.svg)](http://badge.fury.io/rb/amtrak)

Amtrak lets you access to data on Amtrak train stations.

It's based on data from the [Federal Railroad Administration](http://osav-usdot.opendata.arcgis.com/datasets/3e9daf681b154fb19372044f4d52941a_0), with time zone information added.

## Usage

Install the gem by adding it to your Gemfile:

```ruby
gem 'amtrak', '~> 1.0.0'
```

You can then look up a station by its station code (e.g. `BFX` for Buffalo (Exchange Street), New York using `Amtrak.find_by_station_code`, which returns an object with a bunch of accessors like `name` and `city`:

```ruby
Amtrak.find_by_station_code("BFX")
=> #<Amtrak::Station:0x007fd9a1bbd550 @name="Buffalo (Exchange Street), New York", @city="Buffalo", @state="New York", @code="BFX", @latitude="-78.8737", @longitude="42.878545", @timezone="0", @dst="E">
```

A couple of other methods provide access to aggregate data.

You can call `Amtrak.station_codes` for a list of valid IATA codes, perfect for Rails validations:

```ruby
validates :destination_station, inclusion: { in: Amtrak.station_codes, message: "is not a valid station" }
```

Or `Amtrak.all` will provide `Amtrak::Station` objects representing all the stations the gem knows about.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

To update the data included in the gem, just run `bundle exec rake update` and make a pull request with the changes. This will pull the latest data from [OpenFlights](http://openflights.org).

Bug reports and pull requests are welcome on GitHub at https://github.com/agirling/amtrak. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Acknowledgements

The data in this gem is made possible by the  Office of the Assistant Secretary for Research and Technology/Bureau of Transportation Statistics (BTS) National Transportation Atlas Database (NTAD)

This gem is heavily modeled after [Tim Rogers](https://github.com/timrogers)'s [Airports](https://github.com/timrogers/airports) gem.  Thank you for your inspiration.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
