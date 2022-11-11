class OrderItemBlueprint < Blueprinter::Base
  identifier :id

  fields :quantity, :total_amount_cents, :total_amount_pre_tax_cents

  # enchancement: associate item_id
end
