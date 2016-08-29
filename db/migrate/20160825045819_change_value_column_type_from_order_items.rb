class ChangeValueColumnTypeFromOrderItems < ActiveRecord::Migration[5.0]
  def change
    change_column :order_items, :value, :float
  end
end
