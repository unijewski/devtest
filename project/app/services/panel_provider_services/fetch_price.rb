# frozen_string_literal: true

module PanelProviderServices
  class FetchPrice
    def initialize(code:)
      @code = code
    end

    def call
      "PriceStrategies::#{code.classify}".constantize.new.call
    end

    private

    attr_reader :code
  end
end
