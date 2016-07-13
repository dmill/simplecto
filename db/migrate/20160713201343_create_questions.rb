class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.text :answer_text
      t.string :answer_video
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
