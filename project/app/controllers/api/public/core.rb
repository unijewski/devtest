# frozen_string_literal: true

module API
  module Public
    class Core < Grape::API
      prefix "api/public"
      mount API::Public::V1::Base
    end
  end
end
