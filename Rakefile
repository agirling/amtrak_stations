require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "csv"
require "json"
require "timezone"
require 'open-uri'

RSpec::Core::RakeTask.new(:spec)

task :update, [:google_api_key] do |t, args|
  if args[:google_api_key].nil?
    puts "Please provide your Google API key with access to the Time Zones API\nbundle exec rake update[api_key]"
    next
  else
    Timezone::Lookup.config(:google) do |c|
      c.api_key = args[:google_api_key]
    end
  end

  cleaned_data = CSV.foreach('data/stations.csv', headers: true).each_with_object({}) do |row, accumulator|
    station_code = row[3]

    begin 
      lookup = Timezone.lookup(row[1], row[0])
    rescue Timezone::Error::InvalidZone
      next
    end
    timezone = lookup.utc_offset / 60 / 60
    timezone -= 1 if lookup.dst?(Time.now)

    accumulator[station_code] = {
      name: row[4],
      city: row[5],
      state: row[6],
      station_code: station_code,
      latitude: row[1],
      longitude: row[0],
      timezone: timezone,
    }

    puts accumulator[station_code]
  end

  cleaned_data = cleaned_data.reject { |code, _| code.nil? || code == "" }

  File.open("data/stations.json", "w").puts JSON.generate(cleaned_data)
end

task default: :spec
