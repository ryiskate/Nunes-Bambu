class AddAttachmentImageToKitchenwares < ActiveRecord::Migration
  def self.up
    change_table :kitchenwares do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :kitchenwares, :image
  end
end
