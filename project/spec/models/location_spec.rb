# frozen_string_literal: true

require "rails_helper"

describe Location, type: :model do
  describe "validations" do
    subject { build(:location) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_presence_of(:secret_code) }
    it { is_expected.to validate_uniqueness_of(:external_id) }
    it { is_expected.to validate_uniqueness_of(:secret_code) }
  end
end
