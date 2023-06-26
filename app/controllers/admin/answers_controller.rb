class Admin::AnswersController < ApplicationController

  def index
    if params[:name]
      @tag = Tag.find_by(name: params[:name])
      @answers = @tag.answers.order(created_at: :desc).page(params[:page])
    else
      redirect_to root_path
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    Answer.find(params[:id]).destroy
    redirect_to request.referer, notice: "Answerが削除されました"
  end

end
