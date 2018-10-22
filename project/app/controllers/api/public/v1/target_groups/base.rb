# frozen_string_literal: true

module API
  module Public
    module V1
      module TargetGroups
        class Base < Base
          resource :target_groups do
            mount Index
          end
        end
      end
    end
  end
end
