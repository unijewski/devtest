require "rails_helper"

describe TargetGroupSerializer do
  let(:target_group) { build_stubbed(:target_group) }
  let(:result_hash) do
    {
      data: {
        attributes: {
          external_id: target_group.external_id,
          id: target_group.id,
          name: target_group.name,
          secret_code: target_group.secret_code
        },
        id: target_group.id.to_s,
        relationships: relationships,
        type: :target_group
      }
    }
  end

  subject { described_class.new(target_group).serializable_hash }

  shared_examples "returns the proper hash" do
    it "returns the proper hash" do
      is_expected.to eq result_hash
    end
  end

  context "when parent does not exist" do
    let(:relationships) do
      {
        panel_provider: {
          data: { id: target_group.panel_provider.id.to_s, type: :panel_provider }
        },
        parent: { data: nil }
      }
    end

    it_behaves_like "returns the proper hash"
  end

  context "when parent exists" do
    let(:parent) { build_stubbed(:target_group) }
    let(:target_group) { build_stubbed(:target_group, parent: parent) }
    let(:relationships) do
      {
        panel_provider: {
          data: { id: target_group.panel_provider.id.to_s, type: :panel_provider }
        },
        parent: { data: { id: target_group.parent.id.to_s, type: :target_group } }
      }
    end

    it_behaves_like "returns the proper hash"
  end
end
