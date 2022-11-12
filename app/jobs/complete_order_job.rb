class CompleteOrderJob < ApplicationJob
  queue_as :default

  def perform(order)
    order.completed!
  end
end
