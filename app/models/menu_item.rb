class MenuItem < ApplicationRecord
  belongs_to :category

  validates :name, :price_cents, :tax_rate_percentage, presence: true
  validates :price_cents, :tax_rate_percentage, numericality: { only_integer: true }
end
