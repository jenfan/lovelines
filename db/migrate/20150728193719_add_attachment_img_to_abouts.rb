class AddAttachmentImgToAbouts < ActiveRecord::Migration
  def self.up
    change_table :abouts do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :abouts, :img
  end
end
