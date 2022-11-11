class Payment < ApplicationRecord
  belongs_to :order

  after_save :update_order_status

  enum status: {
    pending: 0,
    success: 1,
    failed: 2
  }

  private

  def update_order_status
    order.paid! if status_previously_changed? && success?
  end
end
