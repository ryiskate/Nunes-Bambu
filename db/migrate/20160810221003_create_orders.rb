class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :owner
      t.integer :number
      t.float :valor
      t.string :status
      t.references :ordeable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
