PANEL_PROVIDERS_CODES = %w[times_a ten_arrays times_html].freeze

COUNTRIES = [
  { code: "PL", panel_provider_code: "times_a" },
  { code: "US", panel_provider_code: "ten_arrays" },
  { code: "UK", panel_provider_code: "times_html" }
].freeze

LOCATIONS = [
  { name: "New York" },
  { name: "Los Angeles" },
  { name: "Chicago" },
  { name: "Houston" },
  { name: "Philadelphia" },
  { name: "Phoenix" },
  { name: "San Antonio" },
  { name: "San Diego" },
  { name: "Dallas" },
  { name: "San Jose" },
  { name: "Austin" },
  { name: "Jacksonville" },
  { name: "San Francisco" },
  { name: "Indianapolis" },
  { name: "Columbus" },
  { name: "Fort Worth" },
  { name: "Charlotte" },
  { name: "Detroit" },
  { name: "El Paso" },
  { name: "Seattle" }
].freeze

def create_panel_providers
  PANEL_PROVIDERS_CODES.each.with_index(1) do |panel_provider_code, index|
    record = PanelProvider.create!(code: panel_provider_code)
    instance_variable_set("@panel_provider_#{index}", record)
  end
end

def create_countries
  COUNTRIES.each.with_index(1) do |country_hash, index|
    record = Country.create!(
      code: country_hash.fetch(:code),
      panel_provider: PanelProvider.find_by!(code: country_hash.fetch(:panel_provider_code))
    )
    instance_variable_set("@country_#{index}", record)
  end
end

def create_locations
  LOCATIONS.each do |location|
    Location.create!(
      name: location.fetch(:name), external_id: SecureRandom.uuid, secret_code: SecureRandom.hex(64)
    )
  end
end

def create_mandatory_location_groups
  (1..3).step(1) do |n|
    LocationGroup.create!(
      name: "Location group #{n}",
      country: instance_variable_get("@country_#{n}"),
      panel_provider: instance_variable_get("@panel_provider_#{n}")
    )
  end
end

def create_random_location_group
  random_number = rand(1..3)
  LocationGroup.create!(
    name: "Random group",
    country: instance_variable_get("@country_#{random_number}"),
    panel_provider: instance_variable_get("@panel_provider_#{random_number}")
  )
end

def create_location_groups
  create_mandatory_location_groups
  create_random_location_group
end

def random_panel_provider
  PanelProvider.all.sample
end

def number_of_target_group_children
  rand(3..5)
end

def create_target_group(name, panel_provider, parent_id = nil)
  TargetGroup.create!(
    name: "Target group #{name}",
    external_id: SecureRandom.uuid,
    secret_code: SecureRandom.hex(64),
    panel_provider: panel_provider,
    parent_id: parent_id
  )
end

def create_target_group_children(panel_provider, parent_target_group, level)
  number_of_target_group_children.times do
    new_parent_target_group = create_target_group(
      "#{level}:#{number_of_target_group_children}", panel_provider, parent_target_group.id
    )
    next if level > 3
    create_target_group_children(random_panel_provider, new_parent_target_group, level + 1)
  end
end

def create_target_groups_tree(panel_provider, index)
  root_target_group = create_target_group(index, panel_provider)
  root_target_group.countries << panel_provider.countries.sample
  create_target_group_children(random_panel_provider, root_target_group, 1)
end

def create_mandatory_target_groups
  PanelProvider.all.each.with_index(1) do |panel_provider, index|
    create_target_groups_tree(panel_provider, index)
  end
end

def create_random_target_group
  create_target_groups_tree(random_panel_provider, 4)
end

def create_target_groups
  create_mandatory_target_groups
  create_random_target_group
end

ActiveRecord::Base.transaction do
  puts "Generating seeds..."
  create_panel_providers
  create_countries
  create_locations
  create_location_groups
  create_target_groups
  puts "Seeds done!"
end
