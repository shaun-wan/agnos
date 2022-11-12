class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :payments, dependent: :destroy

  before_save :update_completed_date, if: -> { status_changed? && completed? }
  after_touch :calculate_total_amount
  after_save :complete_order, :send_notification

  enum status: {
    pending: 0,
    paid: 1,
    cancelled: 2,
    completed: 3
  }

  private

  def calculate_total_amount
    self.total_amount_cents = order_items.sum(&:total_amount_cents)
    save
  end

  def update_completed_date
    self.completed_at = Time.current
  end

  # for demo purpose, update order status to 'completed' after 10 seconds when user made payment
  def complete_order
    return unless status_previously_changed? && paid?

    CompleteOrderJob.set(wait: 10.seconds).perform_later(self)
  end

  def send_notification
    return unless status_previously_changed? && completed?

    OrderNotificationChannel.broadcast_to(
      self,
      {
        order_id: id,
        status: status,
        message: "Your order #{id} is ready!"
      }
    )
  end
end
