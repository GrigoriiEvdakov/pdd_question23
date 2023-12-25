class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @questions = Question.all
  end
  
  def check_answers
    ids = params[:answer_ids]
    @result = ScoreCalculation.new.call(ids)
    redirect_to :action => 'result', result: @result 
  end

  def result
    @result = params[:result]
  end  

  def show
    question = Question.find(params[:id])
    answers = question.answers

    service = AnswerService.new(question, answers)
    @correct_answer = service.choose_correct_answer
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end




