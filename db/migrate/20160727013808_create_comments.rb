class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :autor
      t.text :comment
      t.references :lamp, foreign_key: true

      t.timestamps
    end
  end
end
