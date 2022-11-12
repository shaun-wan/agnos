class OrderItemBlueprint < Blueprinter::Base
  identifier :id

  fields :quantity, :total_amount_cents, :total_amount_pre_tax_cents

  association :menu_item, blueprint: MenuItemBlueprint

  association :bundle_item, blueprint: BundleItemBlueprint
end
