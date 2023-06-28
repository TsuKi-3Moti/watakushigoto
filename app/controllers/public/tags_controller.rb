class Public::TagsController < ApplicationController

  def index
    @question = Question.new
    @tags = Tag.order(created_at: :desc).page(params[:page]).per(100)
  end

end
