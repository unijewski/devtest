# frozen_string_literal: true

module EvaluationServices
  class CalculatePrice
    def initialize(params:)
      @params = params
    end

    def call
      country.panel_provider.price
    end

    private

    attr_reader :params

    def country
      Country.find_by!(code: params[:country_code])
    end
  end
end
