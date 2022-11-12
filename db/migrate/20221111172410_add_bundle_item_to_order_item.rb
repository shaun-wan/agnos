class AddBundleItemToOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :bundle_item, null: true, foreign_key: true
  end
end
