require "spec_helper"

RSpec.describe AmtrakStations do
  it "has a version number" do
    expect(AmtrakStations::VERSION).to_not be nil
  end

  describe ".find_by_station_code" do
    subject(:find_by_station_code) do
      described_class.find_by_station_code(station_code)
    end

    context "with a valid station code" do
      let(:station_code) { "BUF" }

      it { is_expected.to be_a(AmtrakStations::Station) }
      its(:name) { is_expected.to eq("Buffalo (Depew), New York") }
    end

    context "with an invalid station code" do
      let(:station_code) { "XOX" }

      it { is_expected.to be_nil }
    end

    context "with a code that is too long" do
      let(:station_code) { "ALICE" }

      it "doesn't try to look it up" do
        expect(described_class.parsed_data).to_not receive(:fetch).with(station_code, nil)
        find_by_station_code
      end
    end
  end

  describe ".station_codes" do
    subject { described_class.station_codes }

    it { is_expected.to be_a(Array) }
    it { is_expected.to include("BUF") }
  end

  describe ".all" do
    subject { described_class.all }

    it { is_expected.to be_a(Array) }
    its(:first) { is_expected.to be_a(AmtrakStations::Station) }
  end
end
