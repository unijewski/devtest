# frozen_string_literal: true

module API
  module Private
    module AuthHelper
      extend ::Grape::API::Helpers

      def authenticate!
        return if access_token && access_token_valid?

        error!("Unauthorized", 401)
      end

      def access_token
        headers["Authorization"]
      end

      def access_token_valid?
        ActiveSupport::SecurityUtils.secure_compare(
          headers["Authorization"],
          Rails.application.credentials.api_access_token
        )
      end
    end
  end
end
