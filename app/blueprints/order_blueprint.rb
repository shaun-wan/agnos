class OrderBlueprint < Blueprinter::Base
  identifier :id

  fields :status, :completed_at, :total_amount_cents

  association :order_items, blueprint: OrderItemBlueprint
end
