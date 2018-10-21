class TargetGroup < ApplicationRecord
  belongs_to :panel_provider
  belongs_to :parent
  has_many :children

  validates :external_id, :name, :secret_code, presence: true
end
