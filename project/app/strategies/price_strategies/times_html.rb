# frozen_string_literal: true

module PriceStrategies
  class TimesHtml < Base
    private

    NODES_LIMIT = 100.0
    private_constant :NODES_LIMIT

    def calculate_value
      Nokogiri::HTML(response).search("*").size / NODES_LIMIT
    end

    def url
      "http://time.com"
    end
  end
end
