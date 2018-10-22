# frozen_string_literal: true

require "rails_helper"

describe EvaluationServices::CalculatePrice do
  describe "#call" do
    let!(:country) { create(:country) }

    subject { described_class.new(params: params).call }

    around(:example) { |example| VCR.use_cassette("time_com", &example) }

    context "when country is found" do
      let(:params) { { country_code: country.code } }

      it "returns calculated price" do
        is_expected.to eq 11.59
      end
    end

    context "when country is not found" do
      let(:params) { { country_code: "ABC" } }

      it "raises an error" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
