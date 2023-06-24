class Admin::QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.includes(:answers, :user).order(created_at: :desc).page(params[:page])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path, notice: "Questionが削除されました"
  end

end
