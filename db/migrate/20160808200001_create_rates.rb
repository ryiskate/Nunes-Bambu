class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.string :autor
      t.decimal :rate
      t.decimal :sumrate
      t.decimal :timesrate

      t.timestamps
    end
  end
end
