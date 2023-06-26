class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_user!, except: [:index]

  def show
    @user = User.find(params[:id])
    @question = Question.new
    @questions = @user.questions.order(created_at: :desc).page(params[:page])
  end

  def index
    redirect_to new_user_registration_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "ユーザ情報を更新しました"
    else
      flash.now[:alert] = "ユーザ情報を更新できませんでした"
      render :edit
    end
  end

  def favorites
    @question = Question.new
    @user = User.find(params[:id])
    @favorited_answers = Answer.left_joins(:favorites).where(favorites: {user: @user}).order(created_at: :desc).page(params[:page])
  end

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

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email = "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
