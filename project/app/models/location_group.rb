# frozen_string_literal: true

class LocationGroup < ApplicationRecord
  belongs_to :country
  belongs_to :panel_provider
end
