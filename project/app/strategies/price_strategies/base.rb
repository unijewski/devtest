# frozen_string_literal: true

module PriceStrategies
  require "net/http"

  class Base
    def call
      calculate_value
    end

    private

    def calculate_value
      raise NotImplementedError, :calculate_value
    end

    def response
      @response ||= Net::HTTP.get(URI(url))
    end

    def url
      raise NotImplementedError, :url
    end
  end
end
