# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    code { "PL" }
    panel_provider
  end

  trait :us_code do
    code { "US" }
    association :panel_provider, :ten_arrays
  end

  trait :uk_code do
    code { "UK" }
    association :panel_provider, :times_html
  end
end
