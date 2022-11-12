class CreateBundleItems < ActiveRecord::Migration[7.0]
  def change
    create_table :bundle_items do |t|
      t.string :name, null: false
      t.references :first_menu_item, foreign_key: { to_table: :menu_items }
      t.references :second_menu_item, foreign_key: { to_table: :menu_items }

      t.integer :price_cents, null: false
      t.integer :tax_rate_percentage, null: false
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
