class Public::FavoritesController < ApplicationController

  def create
    @answer = Answer.find(params[:answer_id])
    favorite = current_user.favorites.new(answer_id: @answer.id, design: params[:design].to_i)
    favorite.save
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    favorite = current_user.favorites.find_by(answer_id: @answer.id)
    favorite.destroy
  end

end
