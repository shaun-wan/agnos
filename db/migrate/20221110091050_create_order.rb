class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0
      t.integer :total_amount_cents, default: 0
      t.datetime :completed_at

      t.timestamps
    end
  end
end
