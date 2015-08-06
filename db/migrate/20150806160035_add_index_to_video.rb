class AddIndexToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :to_index, :boolean
  end
end
