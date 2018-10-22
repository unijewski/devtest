# frozen_string_literal: true

require "rails_helper"

describe PanelProvider, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:countries) }
  end

  describe "validations" do
    subject { build(:panel_provider) }

    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end

  describe "#price" do
    let(:service_instance) { double("PanelProviderServices::FetchPrice") }

    subject { build_stubbed(:panel_provider).price }

    before do
      allow(PanelProviderServices::FetchPrice).to receive(:new).and_return(service_instance)
    end

    it "invokes PanelProviderServices::FetchPrice service" do
      expect(PanelProviderServices::FetchPrice)
        .to receive(:new)
        .with(code: "times_a")
        .and_return(service_instance)
      expect(service_instance).to receive(:call)
      subject
    end
  end
end
