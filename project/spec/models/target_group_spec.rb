# frozen_string_literal: true

require "rails_helper"

describe TargetGroup, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:panel_provider) }
    it do
      is_expected.to belong_to(:parent)
        .optional
        .class_name("TargetGroup")
        .with_foreign_key("parent_id")
    end
    it { is_expected.to have_and_belong_to_many(:countries) }
    it do
      is_expected.to have_many(:children).class_name("TargetGroup").with_foreign_key("parent_id")
    end
  end

  describe "validations" do
    subject { create(:target_group, secret_code: "123") }

    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:secret_code) }
    it { is_expected.to validate_uniqueness_of(:secret_code).case_insensitive }
  end
end
