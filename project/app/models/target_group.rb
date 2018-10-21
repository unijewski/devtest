class TargetGroup < ApplicationRecord
  belongs_to :panel_provider
  belongs_to :parent, optional: true, class_name: name, foreign_key: "parent_id"
  has_and_belongs_to_many :countries
  has_many :children, class_name: name, foreign_key: "parent_id"

  validates :external_id, :name, :secret_code, presence: true
  validates :secret_code, uniqueness: true
end
