class SearchesController < ApplicationController

  def search
    @word = params[:word]
    @model = params[:model]
    @method = params[:method]
    if @model == "question"
      @records = Question.search_for(@word).order(created_at: :desc).page(params[:page])
    else
      @records = Answer.search_for(@word).order(created_at: :desc).page(params[:page])
    end
  end

end
