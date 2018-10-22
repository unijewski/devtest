# frozen_string_literal: true

module API
  module Public
    module V1
      class Base < Core
        version "v1", using: :path
        format :json
        formatter :json, Grape::Formatter::FastJsonapi

        mount Locations::Base
      end
    end
  end
end
