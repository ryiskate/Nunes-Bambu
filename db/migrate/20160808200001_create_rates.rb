class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.decimal :rate
      
      t.timestamps
    end
  end
end
