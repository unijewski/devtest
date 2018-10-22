# frozen_string_literal: true

module API
  module Private
    module V1
      module EvaluateTarget
        class Base < Base
          resource :evaluate_target do
            mount Create
          end
        end
      end
    end
  end
end
