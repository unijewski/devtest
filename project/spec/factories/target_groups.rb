FactoryBot.define do
  factory :target_group do
    name { "Group name" }
    external_id { SecureRandom.uuid }
    secret_code { SecureRandom.hex(64) }
    panel_provider
  end
end
