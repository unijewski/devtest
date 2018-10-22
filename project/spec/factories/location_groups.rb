# frozen_string_literal: true

FactoryBot.define do
  factory :location_group do
    name { "Location group" }
    country
    panel_provider
  end
end
