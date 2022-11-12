module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :order

    def connect
      self.order = find_existing_order(request.params[:order_id])
    end

    private

    def find_existing_order(order_id)
      order = Order.find_by(id: order_id)
      return order if order

      reject_unauthorized_connection
    end
  end
end
