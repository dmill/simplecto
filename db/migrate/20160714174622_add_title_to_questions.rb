class AddTitleToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :title, :string
  end
end
