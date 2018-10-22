# frozen_string_literal: true

require "rails_helper"

describe LocationGroup, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:country) }
    it { is_expected.to belong_to(:panel_provider) }
  end
end
