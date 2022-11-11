module Api
  class OrdersController < Api::ApiController
    def create
      order = Order.create

      render json: OrderBlueprint.render(order)
    end

    def show
      order = Order.includes(:order_items).find(params[:id])

      render json: OrderBlueprint.render(order)
    end
  end
end
