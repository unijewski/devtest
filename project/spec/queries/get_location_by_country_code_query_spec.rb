require "rails_helper"

describe GetLocationByCountryCodeQuery do
  let(:panel_provider1) { create(:panel_provider) }
  let(:panel_provider2) { create(:panel_provider, :ten_arrays) }
  let(:panel_provider3) { create(:panel_provider, :times_html) }

  let(:country_pl) { create(:country, panel_provider: panel_provider1) }
  let(:country_us) { create(:country, :us_code, panel_provider: panel_provider2) }
  let(:country_uk) { create(:country, :uk_code, panel_provider: panel_provider3) }

  let!(:location1) { create(:location) }
  let!(:location2) { create(:location) }
  let!(:location3) { create(:location) }

  let!(:location_group1) do
    create(:location_group, country: country_pl, panel_provider: panel_provider2)
  end
  let!(:location_group2) do
    create(:location_group, country: country_us, panel_provider: panel_provider3)
  end
  let!(:location_group3) do
    create(:location_group, country: country_uk, panel_provider: panel_provider2)
  end
  let!(:location_group4) do
    create(:location_group, country: country_pl, panel_provider: panel_provider2)
  end
  let!(:location_group5) do
    create(:location_group, country: country_pl, panel_provider: panel_provider1)
  end
  let!(:location_group6) do
    create(:location_group, country: country_pl, panel_provider: panel_provider1)
  end

  before do
    location1.location_groups << [location_group1, location_group2]
    location2.location_groups << [location_group3, location_group4]
    location3.location_groups << [location_group5, location_group6]
  end

  describe "#call" do
    subject { described_class.new(country_code: "PL").call }

    it "returns proper records", :aggregate_failures do
      is_expected.to eq [location3]
      is_expected.to_not include(location2, location1)
    end
  end
end
