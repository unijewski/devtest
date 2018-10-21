class Country < ApplicationRecord
  belongs_to :panel_provider
  has_and_belongs_to_many :target_groups, -> { where("parent_id IS NULL") }
  has_many :location_groups

  validates :code, presence: true, uniqueness: true
end
