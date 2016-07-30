class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.string :autor
      t.string :reply
      t.references :replyable, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
