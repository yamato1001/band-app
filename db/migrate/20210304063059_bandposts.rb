class Bandposts < ActiveRecord::Migration[6.0]
  def change
    add_column :bandposts, :category_id, :integer
  end
end
