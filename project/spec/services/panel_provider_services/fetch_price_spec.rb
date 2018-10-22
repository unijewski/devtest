require "rails_helper"

describe PanelProviderServices::FetchPrice do
  describe "#call" do
    subject { described_class.new(code: "ten_arrays").call }

    it "invokes the proper strategy" do
      expect_any_instance_of(PriceStrategies::TenArrays).to receive(:call)
      subject
    end
  end
end
