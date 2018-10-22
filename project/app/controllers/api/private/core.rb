# frozen_string_literal: true

module API
  module Private
    class Core < Grape::API
      helpers AuthHelper
      prefix "api/private"
      mount API::Private::V1::Base
    end
  end
end
