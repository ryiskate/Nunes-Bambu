class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.decimal :value
      t.references :product, foreign_key: true
      t.integer :quantity
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
