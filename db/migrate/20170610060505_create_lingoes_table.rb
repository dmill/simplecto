class CreateLingoesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :lingoes do |t|
      t.string :term
      t.text :definition

      t.timestamps
    end
  end
end
