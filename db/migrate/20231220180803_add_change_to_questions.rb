class AddChangeToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :body, :string
  end
end
