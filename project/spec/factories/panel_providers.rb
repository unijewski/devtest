FactoryBot.define do
  factory :panel_provider do
    code { "times_a" }

    trait :ten_arrays do
      code { "10_arrays" }
    end

    trait :times_html do
      code { "times_html" }
    end
  end
end