module Api
  class OrderItemsController < Api::ApiController
    def create
      # enchancement: check if item_id already exist in order before adding
      order_item = OrderItem.create(order_item_create_params)

      return render_error(order_item.errors.full_messages) unless order_item.valid?

      render json: OrderItemBlueprint.render(order_item)
    end

    def update
      # enchancement: check if order status is pending before updating
      order_item = OrderItem.find(params[:id])

      order_item.update(order_item_update_params)

      render json: OrderItemBlueprint.render(order_item)
    end

    def destroy
      order_item_deleted = OrderItem.destroy(params[:id])

      return render_error('Unable to delete order item') unless order_item_deleted

      render :no_content
    end

    private

    def order_item_create_params
      params.require(:order_item).permit(:order_id, :menu_item_id, :quantity, :note)
    end

    def order_item_update_params
      params.require(:order_item).permit(:quantity, :note)
    end
  end
end
