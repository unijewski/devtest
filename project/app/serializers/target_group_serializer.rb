class TargetGroupSerializer < BaseSerializer
  attributes :external_id, :id, :name, :secret_code
  belongs_to :panel_provider
  belongs_to :parent, record_type: :target_group
end
