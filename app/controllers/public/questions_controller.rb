class Public::QuestionsController < ApplicationController

  def create
    @question = current_user.questions.new(question_params)
    # @Question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question.id), notice: "You have created Question successfully."
    else
      @questions = Question.all
      render :index
    end
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    @new_question = Question.new
    @answer = Answer.new
  end

  def index
    @questions = Question.all
    @question = Question.new
    @user = @question.user
    @latest_answer = Answer.last
  end

  def update
  end

  def edit
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

end
