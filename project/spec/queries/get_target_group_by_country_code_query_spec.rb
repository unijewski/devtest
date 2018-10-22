# frozen_string_literal: true

require "rails_helper"

describe GetTargetGroupByCountryCodeQuery do
  let(:panel_provider1) { create(:panel_provider) }
  let(:panel_provider2) { create(:panel_provider, :ten_arrays) }
  let(:panel_provider3) { create(:panel_provider, :times_html) }

  let(:country_pl) { create(:country, panel_provider: panel_provider1) }
  let(:country_us) { create(:country, :us_code, panel_provider: panel_provider2) }
  let(:country_uk) { create(:country, :uk_code, panel_provider: panel_provider3) }

  let!(:target_group1) { create(:target_group, panel_provider: panel_provider1) }
  let!(:target_group2) { create(:target_group, panel_provider: panel_provider2) }
  let!(:target_group3) { create(:target_group, panel_provider: panel_provider3) }
  let!(:target_group4) { create(:target_group, panel_provider: panel_provider3) }
  let!(:target_group5) { create(:target_group, panel_provider: panel_provider2) }
  let!(:target_group6) { create(:target_group, panel_provider: panel_provider1) }

  before do
    target_group1.countries << [country_pl, country_us]
    target_group2.countries << [country_uk, country_us]
    target_group3.countries << [country_pl, country_uk]
    target_group4.countries << [country_pl, country_us]
    target_group5.countries << [country_pl, country_us]
    target_group6.countries << [country_us, country_pl]
  end

  describe "#call" do
    subject { described_class.new(country_code: "PL").call }

    it "returns proper records", :aggregate_failures do
      is_expected.to eq [target_group1, target_group6]
      is_expected.to_not include(target_group2, target_group3, target_group4, target_group5)
    end
  end
end
