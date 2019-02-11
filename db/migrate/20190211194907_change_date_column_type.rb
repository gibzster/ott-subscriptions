class ChangeDateColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :subscriptions, :subscribed_at, :datetime
  end
end
