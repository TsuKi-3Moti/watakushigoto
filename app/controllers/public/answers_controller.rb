class Public::AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    @answer.save
    @new_answer = Answer.new
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:opinion)
  end

end
