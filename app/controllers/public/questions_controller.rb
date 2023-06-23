class Public::QuestionsController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question.id), notice: "Questionを投稿しました"
    else
      @questions = Question.all
      flash.now[:alert] = "フォームが空になっています。入力してください"
      render :index
    end
  end

  def show
    @question = Question.find(params[:id])
    @new_question = Question.new
    @form = AnswerForm.new(answer: Answer.new(question: @question))
  end

  def index
    @questions = Question.includes(:answers, :user)
    @question = Question.new
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question.id), notice: "Questionを更新しました"
    else
      flash.now[:alert] = "Questionを更新できませんでした"
      render :edit
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: "QuestionとそのAnswerを削除しました"
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def is_matching_login_user
    @question = Question.find(params[:id])
    unless @question.user.id == current_user.id
      redirect_to questions_path
    end
  end

end
