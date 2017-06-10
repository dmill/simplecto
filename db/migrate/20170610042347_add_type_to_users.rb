class AddTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :expert, :boolean, default: false
  end
end
