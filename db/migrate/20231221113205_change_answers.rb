class ChangeAnswers < ActiveRecord::Migration[7.1]
  def change
    remove_column :answers, :answer_id
    add_column :answers, :question_id, :integer
  end
end
