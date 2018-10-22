# frozen_string_literal: true

module API
  module Private
    module V1
      module Locations
        class Index < Base
          desc "Return locations by provided country code"
          params do
            requires :country_code, type: String
          end
          get do
            GetLocationByCountryCodeQuery.new(country_code: params[:country_code]).call
          end
        end
      end
    end
  end
end
