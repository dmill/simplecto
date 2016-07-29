class ChangeQuestionAnswererToExpert < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :answerer_id, :expert_id
  end
end
