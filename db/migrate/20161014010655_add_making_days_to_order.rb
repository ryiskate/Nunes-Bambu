class AddMakingDaysToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :making_days, :integer
  end
end
