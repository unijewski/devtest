# frozen_string_literal: true

module API
  module Private
    module V1
      module EvaluateTarget
        class Create < Base
          desc "Calculates the price"
          params do
            requires :country_code, type: String
            requires :target_group_id, type: Integer
            requires :locations, type: Array do
              requires :id, type: Integer
              requires :panel_size, type: Integer
            end
          end
          post do
            EvaluationServices::CalculatePrice.new(params: declared(params)).call
          end
        end
      end
    end
  end
end
