class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.decimal :order

      t.timestamps
    end
  end
end
