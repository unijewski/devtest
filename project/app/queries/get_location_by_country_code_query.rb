# frozen_string_literal: true

class GetLocationByCountryCodeQuery
  def initialize(country_code:)
    @country_code = country_code
  end

  def call
    Location
      .distinct
      .joins(:location_groups)
      .where(
        location_groups: {
          panel_provider_id: Country.where(code: country_code).select(:panel_provider_id)
        }
      )
  end

  private

  attr_reader :country_code
end
