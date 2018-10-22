# frozen_string_literal: true

require "rails_helper"

describe PriceStrategies::TimesHtml do
  describe "#call" do
    subject { described_class.new.call }

    around(:example) { |example| VCR.use_cassette("time_com", &example) }

    it "calculates the value" do
      is_expected.to eq 0.82
    end
  end
end
