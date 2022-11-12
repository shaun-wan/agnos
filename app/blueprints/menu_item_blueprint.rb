class MenuItemBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :description, :price_cents, :tax_rate_percentage, :available
end
