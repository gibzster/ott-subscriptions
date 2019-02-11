class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :billing_type
      t.date :subscribed_at

      t.timestamps
    end
  end
end
