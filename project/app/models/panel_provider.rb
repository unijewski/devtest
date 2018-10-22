class PanelProvider < ApplicationRecord
  has_many :countries

  validates :code, presence: true, uniqueness: true

  def price
    PanelProviderServices::FetchPrice.new(code: code).call
  end
end
