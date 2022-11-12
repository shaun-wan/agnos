class OrderNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_for order
  end

  def unsubscribed; end
end
