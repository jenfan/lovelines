class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :vimeoid
      t.string :img_url
      t.integer :order

      t.timestamps
    end
  end
end
