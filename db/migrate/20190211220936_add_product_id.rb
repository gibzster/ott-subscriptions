class AddProductId < ActiveRecord::Migration[5.1]
  def up
    add_column :subscriptions, :product_id, :integer
  end

  def down
    remove_column :subscriptions, :product_id
  end
end
