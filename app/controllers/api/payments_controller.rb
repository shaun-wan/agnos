module Api
  class PaymentsController < Api::ApiController
    def create
      order = Order.find(order_id)

      return render_error('Unable to create payment for non-pending order') unless order.pending?

      payment = order.payments.create(status: Payment.statuses['success'])

      render json: payment
    end

    private

    def order_id
      params.require(:payment).dig(:order_id)
    end
  end
end
