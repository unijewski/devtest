class Location < ApplicationRecord
  validates :external_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :secret_code, presence: true
end
