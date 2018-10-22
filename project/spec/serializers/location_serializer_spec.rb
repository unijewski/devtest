# frozen_string_literal: true

require "rails_helper"

describe LocationSerializer do
  let(:location) { build_stubbed(:location) }
  let(:result_hash) do
    {
      data: {
        attributes: {
          external_id: location.external_id,
          id: location.id,
          name: location.name,
          secret_code: location.secret_code
        },
        id: location.id.to_s,
        type: :location
      }
    }
  end

  subject { described_class.new(location).serializable_hash }

  it "returns the proper hash" do
    is_expected.to eq result_hash
  end
end
