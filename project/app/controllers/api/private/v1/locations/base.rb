# frozen_string_literal: true

module API
  module Private
    module V1
      module Locations
        class Base < Base
          resource :locations do
            mount Index
          end
        end
      end
    end
  end
end
