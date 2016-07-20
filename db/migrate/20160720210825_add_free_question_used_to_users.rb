class AddFreeQuestionUsedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :free_question_used, :boolean, default: false
  end
end
