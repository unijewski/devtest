# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { "Krakow" }
    external_id { SecureRandom.uuid }
    secret_code { SecureRandom.hex(64) }
  end
end
