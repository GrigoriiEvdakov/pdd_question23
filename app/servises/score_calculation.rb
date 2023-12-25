class ScoreCalculation
  def call(ids)
    counter = 0
    ids.each do |id|
      answer = Answer.find(id)
      if answer.right_answers == true 
        counter += 1
      end 
    end 
    "Ваш общий балл по тестам #{counter} правильных ответов" 
  end
end