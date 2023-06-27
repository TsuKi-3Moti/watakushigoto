class Admin::TagsController < ApplicationController

  def index
    @tags = Tag.order(created_at: :desc).page(params[:page]).per(100)
  end

  def destroy
    Tag.find_by(name: params[:name]).destroy
    redirect_to request.referer, notice: "Tagが削除されました"
  end

end
