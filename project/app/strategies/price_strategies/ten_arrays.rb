# frozen_string_literal: true

module PriceStrategies
  class TenArrays < Base
    private

    ARRAYS_LIMIT = 10
    private_constant :ARRAYS_LIMIT

    def calculate_arrays(data)
      data.values.select { |element| element.is_a?(Array) && element.size > ARRAYS_LIMIT }.size
    end

    def calculate_value
      result_to_calculate.reduce(0) do |number_of_arrays, elements|
        number_of_arrays + calculate_arrays(elements)
      end
    end

    def parsed_response
      Oj.load(response, symbol_keys: true)
    end

    def result_to_calculate
      @result_to_calculate ||= parsed_response.values.last
    end

    def url
      "http://openlibrary.org/search.json?q=the+lord+of+the+rings"
    end
  end
end
