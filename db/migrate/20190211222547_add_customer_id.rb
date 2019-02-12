class AddCustomerId < ActiveRecord::Migration[5.1]
  def up
    add_column :subscriptions, :customer_id, :integer
  end

  def down
    remove_column :subscriptions, :customer_id
  end
end
