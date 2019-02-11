class ChangeProductTable < ActiveRecord::Migration[5.1]
  def up
    remove_column :products, :platform
    add_column :subscriptions, :platform, :string
  end

  def down
    add_column :products, :platform, :string
    remove_column :subscriptions, :platform
  end
end
