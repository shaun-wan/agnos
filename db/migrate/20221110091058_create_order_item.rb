class CreateOrderItem < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :total_amount_pre_tax_cents
      t.integer :total_amount_cents
      t.string :note

      t.references :order, foreign_key: true
      t.references :menu_item, foreign_key: true
      t.timestamps
    end
  end
end
