require "rails_helper"

describe Country, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:panel_provider) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:panel_provider) }
  end
end
