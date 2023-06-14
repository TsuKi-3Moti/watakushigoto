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
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question.id)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    Answer.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def answer_params
    params.require(:answer).permit(:opinion)
  end

end
