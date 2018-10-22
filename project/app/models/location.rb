# frozen_string_literal: true

class Location < ApplicationRecord
  has_and_belongs_to_many :location_groups

  validates :external_id, :name, :secret_code, presence: true
  validates :external_id, :secret_code, uniqueness: true
end
