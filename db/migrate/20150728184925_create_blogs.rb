class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :subtitle
      t.string :body

      t.timestamps
    end
  end
end
