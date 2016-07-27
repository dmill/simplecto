class CreateLingos < ActiveRecord::Migration[5.0]
  def change
    create_table :lingoes do |t|
      t.string :term, null: false
      t.text :definition, null: false
      t.string :photo_url
      t.timestamps null: false
    end
  end
end
