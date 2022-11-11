class OrderBlueprint < Blueprinter::Base
  identifier :id

  fields :status, :confirmed_at, :total_amount_cents

  association :order_items, blueprint: OrderItemBlueprint
end
