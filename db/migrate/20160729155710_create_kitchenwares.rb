class CreateKitchenwares < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchenwares do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
