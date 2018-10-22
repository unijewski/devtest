# frozen_string_literal: true

module PriceStrategies
  class TimesA < Base
    private

    LETTERS_LIMIT = 100.0
    private_constant :LETTERS_LIMIT

    def calculate_a_chars
      response.count("a")
    end

    def calculate_value
      calculate_a_chars / LETTERS_LIMIT
    end

    def url
      "http://time.com"
    end
  end
end
