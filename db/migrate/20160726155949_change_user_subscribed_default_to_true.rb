class ChangeUserSubscribedDefaultToTrue < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :subscribed, :boolean, default: true
  end
end
