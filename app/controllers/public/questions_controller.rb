class Public::QuestionsController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question.id)
    else
      @questions = Question.all
      render :index
    end
  end

  def show
    @question = Question.find(params[:id])
    @new_question = Question.new
    @answer = Answer.new
    @user = @question.user
  end

  def index
    @questions = Question.includes(:answers, :user)
    @question = Question.new
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
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
