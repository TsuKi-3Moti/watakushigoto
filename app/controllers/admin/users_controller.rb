class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @question = Question.new
    @questions = @user.questions.order(created_at: :desc).page(params[:page])
  end

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザ情報が更新されました"
    else
      flash.now[:alert] = "ユーザ情報の更新に失敗しました"
      render :edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    @favorited_answers = Answer.left_joins(:favorites).where(favorites: {user: @user}).order(created_at: :desc).page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email)
  end

end
