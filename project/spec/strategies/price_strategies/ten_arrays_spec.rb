# frozen_string_literal: true

require "rails_helper"

describe PriceStrategies::TenArrays do
  describe "#call" do
    subject { described_class.new.call }

    around(:example) { |example| VCR.use_cassette("openlibrary_org", &example) }

    it "calculates the value" do
      is_expected.to eq 106
    end
  end
end
