class Public::FavoritesController < ApplicationController

  def create
    @answer = Answer.find(params[:answer_id])
    favorite = current_user.favorites.new(answer_id: @answer.id, design: params[:design].to_i)
    favorite.save
    # redirect_to request.referer
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    favorite = current_user.favorites.find_by(answer_id: @answer.id)
    favorite.destroy
    # redirect_to request.referer
  end

end
