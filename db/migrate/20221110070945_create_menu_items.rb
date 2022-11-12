class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.text :description
      t.integer :price_cents, null: false
      t.integer :tax_rate_percentage, null: false
      t.boolean :available, default: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
