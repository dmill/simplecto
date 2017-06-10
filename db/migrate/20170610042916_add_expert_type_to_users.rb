class AddExpertTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :expert_type, :string
  end
end
