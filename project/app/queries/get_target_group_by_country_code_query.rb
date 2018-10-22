# frozen_string_literal: true

class GetTargetGroupByCountryCodeQuery
  def initialize(country_code:)
    @country_code = country_code
  end

  def call
    TargetGroup.joins(:countries).where(
      "countries.code = ? AND countries.panel_provider_id = target_groups.panel_provider_id",
      country_code
    )
  end

  private

  attr_reader :country_code
end
