class Admin::TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def destroy
    Tag.find_by(name: params[:name]).destroy
    redirect_to request.referer, notice: "Tagが削除されました"
  end

end
