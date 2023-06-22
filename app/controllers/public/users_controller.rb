class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @question = Question.new
    @questions = @user.questions
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def favorites
    @question = Question.new
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:answer_id)
    @favorited_answers = Answer.find(favorites)
  end

  # def unsubscribe
  # end

  # def withdraw
  # end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
