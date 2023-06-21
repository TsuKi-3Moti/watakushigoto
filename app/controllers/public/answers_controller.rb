class Public::AnswersController < ApplicationController

  def create
    @form = AnswerForm.new(answer_params, question: Question.find(params[:question_id]))
    if @form.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def index
    if params[:name]
      @tag = Tag.find_by(name: params[:name])
      @answers = @tag.answers.all
    else
      redirect_to root_path
    end
  end

  def edit
    @form = AnswerForm.new(answer: Answer.find(params[:id]))
  end

  def update
    @answer = Answer.find(params[:id])
    @form = AnswerForm.new(answer_params, answer: @answer)
    if @form.update
      redirect_to question_path(@answer.question.id)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    Answer.find(params[:id]).destroy!
    redirect_to request.referer
  end

  private

  def answer_params
    params.require(:answer).permit(:opinion, :input_tag_name)
  end

  def answer_find
    @answer = Answer.find(params[:id])
  end

end