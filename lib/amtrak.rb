require "json"
require "amtrak/version"
require "amtrak/station"

module Amtrak
  def self.find_by_station_code(station_code)
    return unless station_code.length == 3
    station_data = parsed_data.fetch(station_code, nil)

    return unless station_data

    Station.new(
      station_data.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
    )
  end

  def self.station_codes
    parsed_data.keys
  end

  def self.all
    @all ||= parsed_data.map do |_station_code, station_data|
      Station.new(
        station_data.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
      )
    end
  end

  def self.parsed_data
    @parsed_data ||= JSON.parse(data)
  end

  def self.data
    @data || File.read(data_path)
  end
  private_class_method :data

  def self.data_path
    File.expand_path("../data/stations.json", __dir__)
  end
  private_class_method :data_path
end
