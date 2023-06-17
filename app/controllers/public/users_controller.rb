class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @question = Question.new
    @questions = @user.questions
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

end
