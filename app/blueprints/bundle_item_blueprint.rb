class BundleItemBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :price_cents, :tax_rate_percentage, :available

  association :first_menu_item, blueprint: MenuItemBlueprint
  association :second_menu_item, blueprint: MenuItemBlueprint
end
