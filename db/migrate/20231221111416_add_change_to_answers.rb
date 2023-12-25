class AddChangeToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :body, :string
    add_column :answers, :answer_id, :integer
  end
end
