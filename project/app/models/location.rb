# frozen_string_literal: true

class Location < ApplicationRecord
  validates :external_id, :name, :secret_code, presence: true
  validates :external_id, :secret_code, uniqueness: true
end
