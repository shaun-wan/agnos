class OrderItem < ApplicationRecord
  belongs_to :order, touch: true
  belongs_to :menu_item, optional: true
  belongs_to :bundle_item, optional: true

  validates :quantity, :total_amount_pre_tax_cents, :total_amount_cents, presence: true

  validate :only_menu_item_or_bundle_item?

  before_validation :calculate_total_pre_tax_amount_cents, :calculate_total_amount_cents

  before_destroy :can_destroy?

  private

  def onmenu_ly_item_or_bundle_item?
    errors.add(:order_item, 'can only have either menu item or bundle item') \
      if menu_item.present? && bundle_item.present?
  end

  def calculate_total_pre_tax_amount_cents
    self.total_amount_pre_tax_cents = quantity * (menu_item || bundle_item).price_cents
  end

  def calculate_total_amount_cents
    self.total_amount_cents = (
      total_amount_pre_tax_cents * (1 + (menu_item || bundle_item).tax_rate_percentage / 100.0)
    ).to_int
  end

  def can_destroy?
    return if order.pending?

    throw(:abort)
  end
end
