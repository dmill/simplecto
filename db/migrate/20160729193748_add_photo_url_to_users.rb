class AddPhotoUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo_url, :string, default: ""
  end
end
