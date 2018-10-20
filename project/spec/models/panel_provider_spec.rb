require "rails_helper"

describe PanelProvider, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:code) }
  end
end
