# frozen_string_literal: true

require "rails_helper"

describe Country, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:panel_provider) }
    it { is_expected.to have_and_belong_to_many(:target_groups).conditions("parent_id IS NULL") }
    it { is_expected.to have_many(:location_groups) }
  end

  describe "validations" do
    subject { build(:country) }

    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end
end
