class BundleItem < ApplicationRecord
  belongs_to :first_menu_item, class_name: 'MenuItem'
  belongs_to :second_menu_item, class_name: 'MenuItem'

  validates :name, :price_cents, :tax_rate_percentage, presence: true
  validates :price_cents, :tax_rate_percentage, numericality: { only_integer: true }
end
