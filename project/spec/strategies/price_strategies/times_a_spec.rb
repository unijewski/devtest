# frozen_string_literal: true

require "rails_helper"

describe PriceStrategies::TimesA do
  describe "#call" do
    subject { described_class.new.call }

    around(:example) { |example| VCR.use_cassette("time_com", &example) }

    it "calculates the value" do
      is_expected.to eq 11.59
    end
  end
end
