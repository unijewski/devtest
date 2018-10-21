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
end
