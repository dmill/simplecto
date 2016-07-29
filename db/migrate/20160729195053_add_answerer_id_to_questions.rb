class AddAnswererIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :answerer_id, :integer, default: nil
  end
end
