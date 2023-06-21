class Admin::AnswersController < ApplicationController

  def destroy
    @question = Question.find(params[:question_id])
    Answer.find(params[:id]).destroy!
    redirect_to request.referer
  end

end
