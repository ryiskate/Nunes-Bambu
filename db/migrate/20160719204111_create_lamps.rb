class CreateLamps < ActiveRecord::Migration[5.0]
  def change
    create_table :lamps do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
