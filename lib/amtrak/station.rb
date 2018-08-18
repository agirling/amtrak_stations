module Amtrak
  class Station
    attr_reader :name, :city, :state, :station_code,
      :latitude, :longitude, :timezone

    def initialize(name:, city:, state:, station_code:, latitude:, longitude:, timezone:)
      @name = name
      @city = city
      @state = state
      @station_code = station_code
      @latitude = latitude
      @longitude = longitude
      @timezone = timezone
    end
  end
end
