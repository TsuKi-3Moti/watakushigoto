class Public::TagsController < ApplicationController

  def index
    @tags = Tag.order(created_at: :desc).page(params[:page]).per(3)
  end

end
