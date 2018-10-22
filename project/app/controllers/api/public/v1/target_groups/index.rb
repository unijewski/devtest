# frozen_string_literal: true

module API
  module Public
    module V1
      module TargetGroups
        class Index < Base
          desc "Return target_groups by provided country code"
          params do
            requires :country_code, type: String
          end
          get do
            GetTargetGroupByCountryCodeQuery.new(country_code: params[:country_code]).call
          end
        end
      end
    end
  end
end
