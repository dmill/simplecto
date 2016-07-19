class AddStripeIdAndSubscribedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :subscribed, :boolean, default: false
  end
end
